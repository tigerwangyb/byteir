//===- IRRewrite.cpp ----------------------------------- -----------------===//
//
// Copyright 2022 ByteDance Ltd. and/or its affiliates. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//

#include "byteir/Utils/IRRewrite.h"
#include "byteir/Utils/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/Block.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/Dominance.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/IR/TypeRange.h"
#include "llvm/ADT/EquivalenceClasses.h"
#include "llvm/ADT/SmallVector.h"
#include <tuple>

using namespace llvm;
using namespace mlir;
using namespace mlir::memref;

void mlir::replicateDefiningOp(Block *block,
                               std::function<bool(Operation *)> checkFunc) {
  if (block->empty())
    return;
  auto ctx = block->front().getContext();
  OpBuilder builder(ctx);

  SmallVector<std::tuple<Operation *, unsigned int, unsigned int>> replaceOps;

  for (auto it = block->begin(); it != block->end(); ++it) {
    auto &op = *it;

    for (unsigned int i = 0; i < op.getNumOperands(); ++i) {
      auto val = op.getOperand(i);
      auto opDef = val.getDefiningOp();
      if (opDef != nullptr && checkFunc(opDef)) {
        auto maybeIdx = findResultIndex(opDef, val);
        replaceOps.emplace_back(&op, i, *maybeIdx);
      }
    }
  }

  for (auto &t : replaceOps) {
    auto op = std::get<0>(t);
    auto opId = std::get<1>(t);
    auto resId = std::get<2>(t);
    (void)replicateDefiningOp(builder, op, opId, resId);
  }
}

Operation *mlir::replicateDefiningOp(OpBuilder &b, Operation *op,
                                     unsigned opIdx, unsigned resIdx) {
  if (op == nullptr)
    return nullptr;
  auto opDef = op->getOperand(opIdx).getDefiningOp();
  if (opDef == nullptr)
    return nullptr;
  b.setInsertionPoint(opDef);
  auto cloned = b.clone(*opDef);
  op->setOperand(opIdx, cloned->getResult(resIdx));
  return cloned;
}

Operation *mlir::cloneAndReplaceResultTypes(OpBuilder &b, Operation *op,
                                            IRMapping bvm, TypeRange types) {

  auto newOp = b.clone(*op, bvm);

  // force resetting type since we didn't perform type inference
  // FIXME: change to type inference later if possible
  for (size_t i = 0; i < types.size(); ++i) {
    newOp->getResult(i).setType(types[i]);
  }
  return newOp;
}

Type mlir::mixType(ShapedType cloneFromElementType, ShapedType cloneFromShape) {
  return cloneFromElementType.clone(cloneFromShape.getShape());
}

std::optional<SmallVector<Type>> mlir::mixTypes(TypeRange cloneFromElementTypes,
                                                TypeRange cloneFromShapes) {

  if (cloneFromElementTypes.size() != cloneFromShapes.size()) {
    return std::nullopt;
  }

  llvm::SmallVector<Type> ret;
  ret.reserve(cloneFromElementTypes.size());

  for (auto item : llvm::zip(cloneFromElementTypes, cloneFromShapes)) {

    if (!std::get<0>(item).isa<ShapedType>() ||
        !std::get<1>(item).isa<ShapedType>()) {
      return std::nullopt;
    }

    auto fromElementType = std::get<0>(item).cast<ShapedType>();
    auto fromShape = std::get<1>(item).cast<ShapedType>();

    ret.push_back(fromElementType.clone(fromShape.getShape()));
  }

  return ret;
}

// CMAE use a conservative algorithm bying dominator and post dominator,
// without fine doing dependence analysis.
// For better results, maybe use mem2reg in llvm.
//
// The implemented algorihm in this CMAE:
//
// A load (L1) can be eliminated, if all the following satisfied.
// 1) its nearest dominator is a load (L2), and L1.indices == L2.indices,
//    L1 and L2 in the same block
// 2) (RAW checking) there is either
//   a) no side-effect op or store op (S), making L1 postdominate S.
//   b) if S, making L1 postdominate S, but there is another L3,
//      making L1 postdominate L3, L3 postdominate S, and L1.indices ==
//      L3.indices (basically checking L1 is not S's nearest load postdominator)
// A store (S1) can be eliminated, if all the following satisfied.
// 1) its nearest postDominator a store (S2), S1 and S1.indices == S2.indices
//    S1 and S2 in the same block
// 2) (RAW checking) there is either
//    a) no user or load (L), making S1 dominate L.
//    b) if L, making S1 dominate L, but there is another S3,
//       making S1 dominates S3, S3 dominates L, and S1.indices == S3.indices
//       (basically checking S1 is not L's nearest store dominator)

namespace {
struct NearestDomAndPostInfo {
  Operation *nearestDominator = nullptr;
  Operation *nearestPostDominator = nullptr;
  Operation *nearestLoadPostDominator = nullptr;
  Operation *nearestStoreDominator = nullptr;

  NearestDomAndPostInfo()
      : nearestDominator(nullptr), nearestPostDominator(nullptr),
        nearestLoadPostDominator(nullptr), nearestStoreDominator(nullptr) {}
};

static bool isLoad(Operation *op) {
  return isa<AffineLoadOp>(op) || isa<LoadOp>(op);
}

static bool isStore(Operation *op) {
  return isa<AffineStoreOp>(op) || isa<StoreOp>(op);
}
template <typename T> bool isSameAccessImpl(Operation *x, Operation *y) {
  if (auto tX = dyn_cast<T>(x)) {
    if (auto tY = dyn_cast<T>(y)) {
      return tX.getMemref() == tY.getMemref() &&
             tX.getIndices() == tY.getIndices();
    }
  }
  return false;
}

static bool isSameAccessPattern(Operation *x, Operation *y) {
  if (isSameAccessImpl<AffineLoadOp>(x, y))
    return true;
  if (isSameAccessImpl<AffineStoreOp>(x, y))
    return true;
  if (isSameAccessImpl<LoadOp>(x, y))
    return true;
  if (isSameAccessImpl<StoreOp>(x, y))
    return true;
  return false;
}

static bool isSameOperation(Operation *x, Operation *y) {
  return x->getName() == y->getName();
}

static Value getMemoryAccessBase(Operation *op) {
  if (auto load = dyn_cast<AffineLoadOp>(op)) {
    return load.getMemref();
  }

  if (auto load = dyn_cast<LoadOp>(op)) {
    return load.getMemref();
  }

  if (auto store = dyn_cast<AffineStoreOp>(op)) {
    return store.getMemref();
  }

  if (auto store = dyn_cast<StoreOp>(op)) {
    return store.getMemref();
  }

  // not reachable
  return Value();
}

static void eliminateMemoryAccess(
    llvm::EquivalenceClasses<Operation *> &leader_to_replaced) {

  SmallVector<Operation *, 8> opsToErase;
  for (auto it = leader_to_replaced.begin(); it != leader_to_replaced.end();
       ++it) {
    auto op = it->getData();
    auto leader = leader_to_replaced.getLeaderValue(op);

    if (op != leader) {
      // op need to be replaced by leader
      if (isLoad(op)) {
        op->getResult(0).replaceAllUsesWith(leader->getResult(0));
      }

      opsToErase.push_back(op);
    }
  }

  for (auto op : opsToErase) {
    op->erase();
  }
}

static bool hasNoEffect(Operation *op) {
  if (auto sideEffectingOp = dyn_cast<MemoryEffectOpInterface>(op)) {
    return sideEffectingOp.hasNoEffect();
  }
  return false;
}

static void collectEliminableAccess(
    Value base, DominanceInfo &domInfo, PostDominanceInfo &postDomInfo,
    llvm::EquivalenceClasses<Operation *> &leader_to_replaced) {

  llvm::DenseMap<Operation *, NearestDomAndPostInfo> dpTable;
  SmallVector<SmallVector<Operation *>> reserveDomOrPostTable;

  // help function
  auto checkNearestDominator = [&](Operation *user, Operation *another,
                                   Operation *&nearestDominator) {
    if (nearestDominator == nullptr ||
        domInfo.properlyDominates(nearestDominator, another)) {
      if (isSameOperation(user, another)) {
        if (isSameAccessPattern(user, another)) {
          nearestDominator = another;
        }
      } else {
        nearestDominator = another;
      }
    }
  };

  auto checkNearestPostDominator = [&](Operation *user, Operation *another,
                                       Operation *&nearestPostDominator) {
    if (nearestPostDominator == nullptr ||
        postDomInfo.properlyPostDominates(nearestPostDominator, another)) {
      if (isSameOperation(user, another)) {
        if (isSameAccessPattern(user, another)) {
          nearestPostDominator = another;
        }
      } else {
        nearestPostDominator = another;
      }
    }
  };

  // build dominator and postDominator Table;
  for (auto user : base.getUsers()) {
    if (isLoad(user) || isStore(user)) {
      leader_to_replaced.insert(user);
    }
    // skip user without side-effect
    if (hasNoEffect(user))
      continue;

    NearestDomAndPostInfo dpInfo;
    SmallVector<Operation *> reserveDomOrPost;
    for (auto another : base.getUsers()) {
      // skip user itself
      // skip user without side-effect
      if (user == another || hasNoEffect(another)) {
        continue;
      }

      // handle nearest dominator
      if (domInfo.properlyDominates(another, user)) {
        checkNearestDominator(user, another, dpInfo.nearestDominator);
        if (isStore(another)) {
          checkNearestDominator(user, another, dpInfo.nearestStoreDominator);
        }
      }

      // handle nearest postDominator
      if (postDomInfo.properlyPostDominates(another, user)) {
        checkNearestPostDominator(user, another, dpInfo.nearestPostDominator);
        if (isLoad(another)) {
          checkNearestPostDominator(user, another,
                                    dpInfo.nearestLoadPostDominator);
        }
      }

      // handle reverse
      if ((isLoad(user) && (isStore(another) || !isLoad(another)) &&
           postDomInfo.properlyPostDominates(user, another)) ||
          (isStore(user) && !isStore(another) &&
           domInfo.properlyDominates(user, another))) {
        reserveDomOrPost.push_back(another);
      }
    }

    dpTable[user] = dpInfo;
    reserveDomOrPostTable.push_back(reserveDomOrPost);
  }

  // check eliminable memory access
  size_t i = 0;
  for (auto user : base.getUsers()) {
    Operation *replaceOp = nullptr;
    bool noRAW = true;
    if (isLoad(user)) {
      if (dpTable[user].nearestDominator != nullptr &&
          isLoad(dpTable[user].nearestDominator) &&
          user->getBlock() == dpTable[user].nearestDominator->getBlock()) {
        for (auto s : reserveDomOrPostTable[i]) {
          if (dpTable[s].nearestLoadPostDominator == user) {
            noRAW = false;
            break;
          }
        }
        if (noRAW) {
          replaceOp = dpTable[user].nearestDominator;
        }
      }
    } else if (isStore(user)) {
      if (dpTable[user].nearestPostDominator != nullptr &&
          isStore(dpTable[user].nearestPostDominator) &&
          user->getBlock() == dpTable[user].nearestPostDominator->getBlock()) {
        for (auto l : reserveDomOrPostTable[i]) {
          if (dpTable[l].nearestStoreDominator == user) {
            noRAW = false;
            break;
          }
        }
        if (noRAW) {
          replaceOp = dpTable[user].nearestPostDominator;
        }
      }
    }

    // unionSet
    if (replaceOp != nullptr) {
      auto replaceLeader = leader_to_replaced.getLeaderValue(replaceOp);
      leader_to_replaced.unionSets(replaceLeader, user);
    }

    ++i;
  }
}

} // namespace

void mlir::runCMAEInBlock(Block &block, DominanceInfo &domInfo,
                          PostDominanceInfo &postDomInfo) {
  llvm::EquivalenceClasses<Operation *> leader_to_replaced;
  llvm::SmallDenseSet<Value> examed;
  // collect memory access
  block.walk([&](Operation *op) {
    if (!isLoad(op) && !isStore(op))
      return;
    auto base = getMemoryAccessBase(op);
    if (examed.contains(base))
      return collectEliminableAccess(base, domInfo, postDomInfo,
                                     leader_to_replaced);
    examed.insert(base);
  });

  eliminateMemoryAccess(leader_to_replaced);
}

void mlir::runCMAEInFuncLike(FunctionOpInterface funclike) {
  auto domInfo = DominanceInfo(funclike);
  auto postDomInfo = PostDominanceInfo(funclike);

  for (auto &block : funclike.getBlocks()) {
    runCMAEInBlock(block, domInfo, postDomInfo);
  }
}
