//===- LinalgExtTransformOps.cpp - Implementation of Linalg transform ops -===//
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
// Some code comes from LinalgExtTransformOps.cpp in IREE project
// Original license:
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "byteir/Dialect/Linalg/TransformOps/LinalgExtTransformOps.h"
#include "byteir/Dialect/Ccl/IR/CclOps.h"
#include "byteir/Dialect/Linalg/IR/LinalgExtOps.h"
#include "byteir/Dialect/Linalg/Transforms/Transforms.h"
#include "byteir/Utils/Hoist.h"
#include "byteir/Utils/Utils.h"
#include "mlir/AsmParser/AsmParser.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Transforms/Transforms.h"
#include "mlir/Dialect/PDL/IR/PDL.h"
#include "mlir/Dialect/PDL/IR/PDLTypes.h"
#include "mlir/Dialect/SCF/Transforms/TileUsingInterface.h"
#include "mlir/Dialect/Transform/IR/TransformDialect.h"
#include "mlir/Dialect/Transform/IR/TransformInterfaces.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/IR/Dominance.h"
#include "mlir/IR/Matchers.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Interfaces/TilingInterface.h"
#include "mlir/Transforms/InliningUtils.h"
#include "mlir/Transforms/RegionUtils.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/Support/Debug.h"
#include <numeric>

using namespace mlir;
using namespace mlir::linalg;
using namespace mlir::linalg_ext;
using namespace mlir::scf;
using namespace mlir::transform;

#define DEBUG_TYPE "linalg-ext-transforms"
#define DBGS() (llvm::dbgs() << '[' << DEBUG_TYPE << "] ")

namespace {
/// A simple pattern rewriter that implements no special logic.
class SimpleRewriter : public PatternRewriter {
public:
  SimpleRewriter(MLIRContext *context) : PatternRewriter(context) {}
};

} // namespace

//===----------------------------------------------------------------------===//
// AnnotateOp
//===----------------------------------------------------------------------===//

DiagnosedSilenceableFailure
transform::AnnotateOp::apply(TransformResults &transformResults,
                             TransformState &state) {

  ArrayRef<Operation *> targets = state.getPayloadOps(getTarget());

  auto attrs = getOperation()->getAttrs();
  for (auto &target : targets) {
    addAttrs(target, attrs);
  }

  return DiagnosedSilenceableFailure::success();
}

ParseResult transform::AnnotateOp::parse(OpAsmParser &parser,
                                         OperationState &result) {
  OpAsmParser::UnresolvedOperand target;
  auto pdlOperationType = pdl::OperationType::get(parser.getContext());
  if (parser.parseOperand(target) ||
      parser.resolveOperand(target, pdlOperationType, result.operands) ||
      parser.parseOptionalAttrDict(result.attributes)) {
    return ParseResult::failure();
  }
  return success();
}

void AnnotateOp::print(OpAsmPrinter &p) {
  p << ' ' << getTarget();
  p.printOptionalAttrDict((*this)->getAttrs());
}

void transform::AnnotateOp::getEffects(
    SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
  consumesHandle(getTarget(), effects);
  modifiesPayload(effects);
}

//===----------------------------------------------------------------------===//
// FuseExtOp
//===----------------------------------------------------------------------===//

namespace {

/// Apply a tiling transformation to all payload ops and store both the
/// tiled operation as well as the created tile loops.
static LogicalResult applyTilingToAll(
    Operation *transformOp, ArrayRef<Operation *> payloadOps, unsigned numLoops,
    transform::TransformResults &transformResults,
    function_ref<FailureOr<scf::SCFTileAndFuseResult>(TilingInterface)>
        applyFn) {
  SmallVector<Operation *> tiledLinalgOps;
  SmallVector<SmallVector<Operation *>> loopOps(numLoops);
  for (unsigned int i = 0; i < numLoops; ++i)
    loopOps[i].reserve(payloadOps.size());

  auto ctx = transformOp->getContext();
  RewritePatternSet patterns(ctx);
  ForOp::getCanonicalizationPatterns(patterns, ctx);
  FrozenRewritePatternSet frozenPatterns(std::move(patterns));

  for (Operation *target : payloadOps) {
    auto funcOp = target->getParentOfType<func::FuncOp>();

    // simplify tensor::DimOp
    simplifyTensorDimOpUsedInLinalgWithinOp(*funcOp.getOperation());
    auto tilingInterfaceOp = dyn_cast<TilingInterface>(target);
    if (!tilingInterfaceOp)
      return transformOp->emitError("only TilingInterface ops are supported");

    SimpleRewriter rewriter(target->getContext());
    rewriter.setInsertionPoint(target);
    FailureOr<scf::SCFTileAndFuseResult> tiledResults =
        applyFn(tilingInterfaceOp);
    if (failed(tiledResults))
      return failure();

    auto domInfo = DominanceInfo(target->getParentOfType<func::FuncOp>());
    auto postDomInfo =
        PostDominanceInfo(target->getParentOfType<func::FuncOp>());

    // Perform the replacement of tiled and fused values.
    llvm::SmallSetVector<Operation *, 8> opsToReplace;
    opsToReplace.insert(target);
    SmallVector<Operation *> unfusedUser;
    for (auto fusedOp : tiledResults->fusedProducers) {
      opsToReplace.insert(fusedOp);
    }

    for (Operation *toReplace : opsToReplace) {
      SmallVector<Value> replacements;
      replacements.reserve(toReplace->getNumResults());
      for (OpResult res : toReplace->getResults()) {
        auto it = tiledResults->replacements.find(res);
        if (it == tiledResults->replacements.end()) {
          replacements.push_back(res); // unchanged
        } else {
          replacements.push_back(it->getSecond()); // replaced
        }

        // collect unfusedUser
        for (auto user : res.getUsers()) {
          if (opsToReplace.contains(user))
            continue;
          unfusedUser.push_back(user);
        }
      }

      llvm::SmallSetVector<Operation *, 8> replacementDefs;
      for (auto replacement : replacements) {
        if (auto defOp = replacement.getDefiningOp()) {
          if (!replacementDefs.contains(defOp)) {
            replacementDefs.insert(defOp);
          }
        }
      }

      for (auto user : unfusedUser) {
        hoistDownDescendantUsers(user, postDomInfo);
      }

      auto allowReplacement = [&](OpOperand &use) {
        for (auto replaceVal : replacements) {
          if (auto def = replaceVal.getDefiningOp()) {
            if (!domInfo.properlyDominates(def, use.getOwner())) {
              return false;
            }
          }
        }
        return true;
      };

      rewriter.replaceOpWithIf(toReplace, replacements, allowReplacement);

      // simplify tensor::DimOp
      simplifyTensorDimOpUsedInLinalgWithinOp(*funcOp.getOperation());
    }

    // Report back the relevant handles to the transform op.
    tiledLinalgOps.push_back(tiledResults->tiledAndFusedOps.front());
    assert(tiledResults->loops.size() == numLoops &&
           "Mismatched number of loops, tile and fuse transform should have "
           "failed");
    for (unsigned int i = 0; i < numLoops; ++i)
      loopOps[i].push_back(tiledResults->loops[i]);
  } // for (Operation *target : payloadOps)

  transformResults.set(transformOp->getOpResult(0), tiledLinalgOps);
  for (unsigned int i = 0; i < numLoops; ++i)
    transformResults.set(transformOp->getOpResult(i + 1), loopOps[i]);

  return success();
}

/// Parse a tiling-like operation that returns the tiled op as well as the
/// created tile loops. The function counts the non-zero tile sizes to compute
/// the number of results.
static ParseResult parseTileLikeOp(OpAsmParser &parser, OperationState &result,
                                   StringRef sizesAttrName) {
  OpAsmParser::UnresolvedOperand targetOperand;
  SMLoc opLoc = parser.getCurrentLocation();
  if (parser.parseOperand(targetOperand) ||
      parser.parseOptionalAttrDict(result.attributes))
    return failure();
  Attribute sizesAttr = result.attributes.get(sizesAttrName);
  if (!sizesAttr)
    return parser.emitError(opLoc)
           << "expected '" << sizesAttrName << "' attribute";
  auto sizesArrayAttr = sizesAttr.dyn_cast<ArrayAttr>();
  if (!sizesArrayAttr)
    return parser.emitError(opLoc)
           << "'" << sizesAttrName << "' attribute must be an array";
  Type pdlOpType = parser.getBuilder().getType<pdl::OperationType>();
  size_t numExpectedLoops =
      sizesArrayAttr.size() -
      llvm::count(extractFromI64ArrayAttr(sizesArrayAttr), 0);
  result.addTypes(SmallVector<Type>(numExpectedLoops + 1, pdlOpType));
  if (parser.resolveOperand(targetOperand, pdlOpType, result.operands))
    return failure();
  return success();
}

} // namespace

DiagnosedSilenceableFailure
transform::FuseExtOp::apply(mlir::transform::TransformResults &transformResults,
                            mlir::transform::TransformState &state) {
  SmallVector<int64_t> tileSizes = extractFromI64ArrayAttr(getTileSizes());
  SmallVector<int64_t> tileInterchange =
      extractFromI64ArrayAttr(getTileInterchange());

  scf::SCFTilingOptions tilingOptions;
  tilingOptions.interchangeVector = tileInterchange;
  tilingOptions = tilingOptions.setTileSizes(tileSizes);
  scf::SCFTileAndFuseOptions tileAndFuseOptions;
  tileAndFuseOptions.tilingOptions = tilingOptions;
  LogicalResult result = applyTilingToAll(
      getOperation(), state.getPayloadOps(getTarget()),
      tileSizes.size() - llvm::count(tileSizes, 0), transformResults,
      [&](TilingInterface tilingInterfaceOp)
          -> FailureOr<scf::SCFTileAndFuseResult> {
        SimpleRewriter rewriter(getContext());
        return tileConsumerAndFuseProducerUsingSCFForOpExt(
            rewriter, tilingInterfaceOp, tileAndFuseOptions,
            /*simplifyLoopIter*/ true);
      });

  return failed(result) ? DiagnosedSilenceableFailure::definiteFailure()
                        : DiagnosedSilenceableFailure::success();
}

ParseResult transform::FuseExtOp::parse(OpAsmParser &parser,
                                        OperationState &result) {
  return parseTileLikeOp(
      parser, result,
      transform::FuseExtOp::getTileSizesAttrName(result.name).getValue());
}

void transform::FuseExtOp::print(OpAsmPrinter &p) {
  p << ' ';
  p << getTarget();
  p.printOptionalAttrDict((*this)->getAttrs());
}

LogicalResult transform::FuseExtOp::verify() {
  SmallVector<int64_t> permutation =
      extractFromI64ArrayAttr(getTileInterchange());
  auto sequence = llvm::to_vector(llvm::seq<int64_t>(0, permutation.size()));
  if (!std::is_permutation(sequence.begin(), sequence.end(),
                           permutation.begin(), permutation.end())) {
    return emitOpError() << "expects interchange to be a permutation, found "
                         << getTileInterchange();
  }
  return success();
}

//===----------------------------------------------------------------------===//
// InlineOp
//===----------------------------------------------------------------------===//

namespace {
// just inline everything
struct SimpleInliner : public InlinerInterface {
  using InlinerInterface::InlinerInterface;

  bool isLegalToInline(Operation *call, Operation *callable,
                       bool wouldBeCloned) const override {
    return true;
  }
  bool isLegalToInline(Region *dest, Region *src, bool wouldBeCloned,
                       IRMapping &valueMapping) const override {
    return true;
  }
  bool isLegalToInline(Operation *op, Region *dest, bool wouldBeCloned,
                       IRMapping &valueMapping) const override {
    return true;
  }
};
} // namespace

DiagnosedSilenceableFailure
transform::InlineOp::apply(transform::TransformResults &results,
                           transform::TransformState &state) {
  SmallVector<Operation *> inlined;
  SimpleInliner inliner(getContext());
  for (Operation *target : state.getPayloadOps(getTarget())) {
    auto callOp = dyn_cast_or_null<CallOpInterface>(target);
    if (!callOp)
      return emitDefaultDefiniteFailure(target)
             << " inline transformation should be applied on CallOp";

    auto funcOp = dyn_cast_or_null<func::FuncOp>(callOp.resolveCallable());
    if (!funcOp || funcOp.isExternal())
      return emitDefaultDefiniteFailure(target)
             << " inline transformation should be applied on non-external "
                "function";

    if (failed(inlineCall(inliner, callOp, funcOp, funcOp.getCallableRegion(),
                          true)))
      return emitDefaultDefiniteFailure(target)
             << " inline call failed at inline transformation";

    callOp->erase();
    if (funcOp.symbolKnownUseEmpty(state.getTopLevel()))
      funcOp->erase();
  }
  return DiagnosedSilenceableFailure::success();
}

//===----------------------------------------------------------------------===//
// OutlineOp
//===----------------------------------------------------------------------===//

namespace {
LogicalResult outlineSingleLinalgOp(RewriterBase &rewriter, Operation *linalgOp,
                                    StringRef funcName, bool isLibcall,
                                    func::FuncOp &funcOp,
                                    func::CallOp &callOp) {
  Operation *symbolTableOp = SymbolTable::getNearestSymbolTable(linalgOp);
  SymbolTable symbolTable(symbolTableOp);
  if (isLibcall) {
    if ((funcOp = symbolTable.lookup<func::FuncOp>(funcName)) != nullptr) {
      if (!funcOp.isExternal()) // must be external function for libcall
        return failure();

      rewriter.setInsertionPoint(linalgOp);
      callOp = rewriter.replaceOpWithNewOp<func::CallOp>(
          linalgOp, funcOp, linalgOp->getOperands());
      return success();
    }
  }

  Location loc = linalgOp->getLoc();
  FunctionType funcType = rewriter.getFunctionType(linalgOp->getOperandTypes(),
                                                   linalgOp->getResultTypes());
  rewriter.setInsertionPoint(linalgOp->getParentOfType<func::FuncOp>());
  funcOp = rewriter.create<func::FuncOp>(loc, funcName, funcType);
  funcOp.setPrivate();
  // insert to symbol table to avoid name collision
  symbolTable.insert(funcOp);
  if (!isLibcall) {
    Block *entryBlock = funcOp.addEntryBlock();
    rewriter.setInsertionPointToStart(entryBlock);
    IRMapping bvm;
    bvm.map(linalgOp->getOperands(), entryBlock->getArguments());
    auto newLinalgOp = rewriter.clone(*linalgOp, bvm);
    rewriter.create<func::ReturnOp>(loc, newLinalgOp->getResults());
  }
  rewriter.setInsertionPoint(linalgOp);
  callOp = rewriter.replaceOpWithNewOp<func::CallOp>(linalgOp, funcOp,
                                                     linalgOp->getOperands());
  return success();
}

bool anyUsedValuesDefinedAbove(MutableArrayRef<Region> regions) {
  bool anyUsed = false;
  visitUsedValuesDefinedAbove(regions, [&](OpOperand *) { anyUsed = true; });
  return anyUsed;
}
} // namespace

DiagnosedSilenceableFailure
transform::LinalgOutlineOp::apply(transform::TransformResults &results,
                                  transform::TransformState &state) {
  llvm::SmallSetVector<Operation *, 4> funcs;
  SmallVector<Operation *> calls;
  for (Operation *target : state.getPayloadOps(getTarget())) {
    if (anyUsedValuesDefinedAbove(target->getRegions()))
      return emitDefaultDefiniteFailure(target);

    IRRewriter rewriter(target->getContext());
    func::FuncOp funcOp;
    func::CallOp callOp;
    if (failed(outlineSingleLinalgOp(rewriter, target, getFuncName(),
                                     getLibcall(), funcOp, callOp)))
      return emitDefaultDefiniteFailure(target);

    funcs.insert(funcOp);
    calls.push_back(callOp);
  }
  results.set(getFunctions().cast<OpResult>(), funcs.getArrayRef());
  results.set(getCalls().cast<OpResult>(), calls);
  return DiagnosedSilenceableFailure::success();
}

//===----------------------------------------------------------------------===//
// TileLoopHintOp
//===----------------------------------------------------------------------===//

DiagnosedSilenceableFailure
transform::TileLoopHintOp::apply(TransformResults &transformResults,
                                 TransformState &state) {
  ArrayRef<Operation *> targets = state.getPayloadOps(getTarget());
  for (auto op : targets) {
    if (!isa<TilingInterface>(op)) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError() << "only TilingInterface ops are supported";
      diag.attachNote(op->getLoc()) << "target op";
      return diag;
    }

    SmallVector<scf::ForOp> loops;
    Operation *cur = op;

    while (cur) {
      if (auto forOp = cur->getParentOfType<scf::ForOp>()) {
        loops.push_back(forOp);
        cur = forOp;
      } else {
        break;
      }
    }
    loops = llvm::to_vector(llvm::reverse(loops));

    if (loops.empty()) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "no loops at";
      diag.attachNote(op->getLoc()) << "target op";
      return diag;
    }

    labelTileLoopType(op, loops);
  }
  return DiagnosedSilenceableFailure::success();
}

ParseResult transform::TileLoopHintOp::parse(OpAsmParser &parser,
                                             OperationState &result) {
  OpAsmParser::UnresolvedOperand target;
  auto pdlOperationType = pdl::OperationType::get(parser.getContext());
  if (parser.parseOperand(target) ||
      parser.resolveOperand(target, pdlOperationType, result.operands) ||
      parser.parseOptionalAttrDict(result.attributes))
    return ParseResult::failure();
  return success();
}

void TileLoopHintOp::print(OpAsmPrinter &p) {
  p << ' ' << getTarget();
  p.printOptionalAttrDict((*this)->getAttrs());
}

void transform::TileLoopHintOp::getEffects(
    SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
  onlyReadsHandle(getTarget(), effects);
  onlyReadsPayload(effects);
}

//===----------------------------------------------------------------------===//
// TileExtOp
//===----------------------------------------------------------------------===//

namespace {

// We want to parse `DenseI64ArrayAttr` using the short form without the
// `array` prefix to be consistent in the IR with `parseDynamicIndexList`.
static ParseResult parseOptionalInterchange(OpAsmParser &parser,
                                            OperationState &result) {
  if (succeeded(parser.parseOptionalLBrace())) {
    if (failed(parser.parseKeyword("interchange")))
      return parser.emitError(parser.getNameLoc()) << "expect `interchange`";
    if (failed(parser.parseEqual()))
      return parser.emitError(parser.getNameLoc()) << "expect `=`";
    result.addAttribute("interchange",
                        DenseI64ArrayAttr::parse(parser, Type{}));
    if (failed(parser.parseRBrace()))
      return parser.emitError(parser.getNameLoc()) << "expect `}`";
  }
  return success();
}

static void printOptionalInterchange(OpAsmPrinter &p,
                                     ArrayRef<int64_t> interchangeVals) {
  if (!interchangeVals.empty()) {
    p << " {interchange = [";
    llvm::interleaveComma(interchangeVals, p,
                          [&](int64_t integer) { p << integer; });
    p << "]}";
  }
}

} // namespace

DiagnosedSilenceableFailure
transform::TileExtOp::apply(TransformResults &transformResults,
                            TransformState &state) {
  ArrayRef<int64_t> tileSizes = getStaticSizes();

  ArrayRef<Operation *> targets = state.getPayloadOps(getTarget());
  SmallVector<ArrayRef<Operation *>> dynamicSizeProducers;
  dynamicSizeProducers.reserve(getDynamicSizes().size());
  for (Value dynamicSizeProducerHandle : getDynamicSizes()) {
    dynamicSizeProducers.push_back(
        state.getPayloadOps(dynamicSizeProducerHandle));

    if (dynamicSizeProducers.back().size() != targets.size()) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "expected as many dynamic size-producing operations ("
          << dynamicSizeProducers.back().size() << ") as target ops ("
          << targets.size() << ")";
      diag.attachNote(dynamicSizeProducerHandle.getLoc()) << "for this handle";
      return diag;
    }

    for (Operation *op : dynamicSizeProducers.back()) {
      if (op->getNumResults() == 1 &&
          op->getResult(0).getType().isa<IndexType>())
        continue;
      DiagnosedSilenceableFailure diag =
          emitSilenceableError() << "expected sizes to be produced by ops "
                                    "with a single index-type result";
      diag.attachNote(op->getLoc()) << "size producer op";
      diag.attachNote(dynamicSizeProducerHandle.getLoc()) << "for this handle";
      return diag;
    }
  }

  SmallVector<Operation *> tiled;
  SmallVector<SmallVector<Operation *, 4>, 4> loops;
  loops.resize(getLoops().size());
  for (const auto &en : llvm::enumerate(targets)) {
    if (!isa<TilingInterface>(en.value())) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "only linalg ops are supported";
      diag.attachNote(en.value()->getLoc()) << "target op";
      return diag;
    }

    scf::SCFTilingOptions tilingOptions;
    unsigned index = en.index();
    if (!tileSizes.empty()) {
      tilingOptions.setTileSizeComputationFunction(
          [&, index](OpBuilder &b, Operation *) {
            SmallVector<Value, 4> sizes;
            sizes.reserve(tileSizes.size());
            unsigned dynamicIdx = 0;
            for (OpFoldResult ofr : getMixedSizes()) {
              if (auto attr = ofr.dyn_cast<Attribute>()) {
                sizes.push_back(b.create<arith::ConstantIndexOp>(
                    getLoc(), attr.cast<IntegerAttr>().getInt()));
              } else {
                sizes.push_back(
                    dynamicSizeProducers[dynamicIdx++][index]->getResult(0));
              }
            }
            return sizes;
          });
    }

    tilingOptions.setInterchange(getInterchange());
    SimpleRewriter rewriter(en.value()->getContext());

    FailureOr<scf::SCFTilingResult> maybeTilingResult = tileUsingSCFForOp(
        rewriter, cast<TilingInterface>(en.value()), tilingOptions);

    if (failed(maybeTilingResult))
      return DiagnosedSilenceableFailure::definiteFailure();

    if (failed(isValidTiling(maybeTilingResult->tiledOps.back()))) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "unsupported tiling dim at ";
      diag.attachNote(en.value()->getLoc()) << "target op";
      return diag;
    }

    rewriter.replaceOp(en.value(),
                       maybeTilingResult->loops.front()->getResults());

    tiled.push_back(maybeTilingResult->tiledOps.back());
    for (const auto &en2 : llvm::enumerate(maybeTilingResult->loops))
      loops[en2.index()].push_back(en2.value());
  }

  transformResults.set(getTiledLinalgOp().cast<OpResult>(), tiled);
  for (const auto &en : llvm::enumerate(loops))
    transformResults.set(getLoops()[en.index()].cast<OpResult>(), en.value());

  return DiagnosedSilenceableFailure::success();
}

SmallVector<OpFoldResult> transform::TileExtOp::getMixedSizes() {
  ValueRange dynamic = getDynamicSizes();
  ArrayRef<int64_t> tileSizes = getStaticSizes();
  SmallVector<OpFoldResult> results;
  results.reserve(tileSizes.size());
  unsigned dynamicPos = 0;
  Builder builder(getContext());
  for (int64_t size : tileSizes) {
    if (size == ShapedType::kDynamic) {
      results.push_back(dynamic[dynamicPos++]);
    } else {
      results.push_back(builder.getIndexAttr(size));
    }
  }
  return results;
}

ParseResult transform::TileExtOp::parse(OpAsmParser &parser,
                                        OperationState &result) {
  OpAsmParser::UnresolvedOperand target;
  SmallVector<OpAsmParser::UnresolvedOperand> dynamicSizes;
  DenseI64ArrayAttr staticSizes;
  auto pdlOperationType = pdl::OperationType::get(parser.getContext());
  if (parser.parseOperand(target) ||
      parser.resolveOperand(target, pdlOperationType, result.operands) ||
      parseDynamicIndexList(parser, dynamicSizes, staticSizes) ||
      parser.resolveOperands(dynamicSizes, pdlOperationType, result.operands))
    return ParseResult::failure();

  // Parse optional interchange.
  if (failed(parseOptionalInterchange(parser, result)))
    return ParseResult::failure();
  result.addAttribute(getStaticSizesAttrName(result.name), staticSizes);
  size_t numExpectedLoops =
      staticSizes.size() - llvm::count(staticSizes.asArrayRef(), 0);
  result.addTypes(SmallVector<Type>(numExpectedLoops + 1, pdlOperationType));
  return success();
}

void TileExtOp::print(OpAsmPrinter &p) {
  p << ' ' << getTarget();
  printDynamicIndexList(p, getOperation(), getDynamicSizes(), getStaticSizes());
  printOptionalInterchange(p, getInterchange());
}

void transform::TileExtOp::getEffects(
    SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
  consumesHandle(getTarget(), effects);
  onlyReadsHandle(getDynamicSizes(), effects);
  producesHandle(getTiledLinalgOp(), effects);
  producesHandle(getLoops(), effects);
  modifiesPayload(effects);
}

//===----------------------------------------------------------------------===//
// SharedOutputToDistributedStyleOp
//===----------------------------------------------------------------------===//

namespace {

StringAttr getAllReduceType(linalg::GenericOp mergeOp, linalg::FillOp initOp) {
  StringAttr reduceType;
  MLIRContext *ctx = mergeOp.getContext();
  Block *block = &mergeOp.getRegion().front();
  if (isBlockSingleOp<arith::AddFOp>(block) ||
      isBlockSingleOp<arith::AddIOp>(block))
    reduceType = StringAttr::get(ctx, ccl::getRedOpSumName());
  else if (isBlockSingleOp<arith::MaxFOp>(block) ||
           isBlockSingleOp<arith::MaxSIOp>(block) ||
           isBlockSingleOp<arith::MaxUIOp>(block))
    reduceType = StringAttr::get(ctx, ccl::getRedOpMaxName());
  else if (isBlockSingleOp<arith::MinFOp>(block) ||
           isBlockSingleOp<arith::MinSIOp>(block) ||
           isBlockSingleOp<arith::MinUIOp>(block))
    reduceType = StringAttr::get(ctx, ccl::getRedOpMinName());
  // TODO: support avg / prod all-reduce type
  else {
    DBGS() << "operations in the block can't match any reduce type\n";
    return nullptr;
  }

  auto constOp = initOp.getInputs()[0].getDefiningOp<arith::ConstantOp>();
  if (!constOp) {
    DBGS() << "fill op's input is expected to be type of arith.constant\n";
    return nullptr;
  }

  TypedAttr constVal = constOp.getValue();
  if (auto intVal = dyn_cast<IntegerAttr>(constVal)) {
    auto value = intVal.getAPSInt();
    if ((value.isZero() && reduceType.strref() == ccl::getRedOpSumName()) ||
        (value.isMaxSignedValue() &&
         reduceType.strref() == ccl::getRedOpMinName()) ||
        (value.isMinSignedValue() &&
         reduceType.strref() == ccl::getRedOpMaxName()))
      return reduceType;
  } else if (auto floatVal = dyn_cast<FloatAttr>(constVal)) {
    auto value = floatVal.getValue();
    if ((value.isZero() && reduceType.strref() == ccl::getRedOpSumName()) ||
        (value.isInfinity() && !value.isNegative() &&
         reduceType.strref() == ccl::getRedOpMinName()) ||
        (value.isInfinity() && value.isNegative() &&
         reduceType.strref() == ccl::getRedOpMaxName()))
      return reduceType;
  }

  return nullptr;
}

/// Returns an ArrayAttr that contains `nLoops` attributes. All the attributes
/// are "parallel" except the last `nReduction` elements, where are "reduction"
/// attributes.
static SmallVector<utils::IteratorType, 3>
getParallelAndReductionIterators(unsigned nLoops, unsigned nReduction) {
  SmallVector<utils::IteratorType, 3> res(nLoops - nReduction,
                                          utils::IteratorType::parallel);
  res.append(nReduction, utils::IteratorType::reduction);
  return res;
}

static SmallVector<utils::IteratorType, 3>
getNParallelLoopsAttrs(unsigned nParallelLoops) {
  return getParallelAndReductionIterators(nParallelLoops, 0);
}

} // namespace

DiagnosedSilenceableFailure transform::SharedOutputToDistributedStyleOp::apply(
    TransformResults &transformResults, TransformState &state) {
  ArrayRef<Operation *> loops = state.getPayloadOps(getLoop());
  ArrayRef<Operation *> inits = state.getPayloadOps(getInit());
  ArrayRef<Operation *> merges = state.getPayloadOps(getMerge());

  if (loops.size() != inits.size() || loops.size() != merges.size()) {
    DiagnosedSilenceableFailure diag =
        emitSilenceableError()
        << "the size of loop, init, merge should be the same";
    return diag;
  }

  SmallVector<Operation *> newFillOps;
  SmallVector<Operation *> newLoopOps;
  for (size_t i = 0; i < loops.size(); ++i) {
    // check operation types for each payloads
    auto loopOp = dyn_cast<scf::ForallOp>(loops[i]);
    auto initOp = dyn_cast<linalg::FillOp>(inits[i]);
    auto mergeOp = dyn_cast<linalg::GenericOp>(merges[i]);
    if (!loopOp) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "loop op is supposed to be of type scf.forall op";
      return diag;
    }
    if (!initOp) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "init op is supposed to be of type linalg.fill";
      return diag;
    }
    if (!mergeOp) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "merge op is supposed to be of type linalg.generic";
      return diag;
    }

    // other checks for these ops
    if (!mergeOp.getRegion().hasOneBlock()) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "expected to have only one block";
      return diag;
    }
    SmallVector<unsigned> redDims;
    linalg::LinalgOp linalgOp = cast<LinalgOp>((Operation *)mergeOp);
    linalgOp.getReductionDims(redDims);
    if (redDims.size() != 1) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "expected 1 reduction dim, but get "
                                         << redDims.size();
      return diag;
    }
    if (initOp.getInputs().size() != 1) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "fill op is expected to have only one input";
      return diag;
    }
    if (mergeOp.getResultTensors().size() != 1) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "merge op is expected to have only one result";
      return diag;
    }
    if (loopOp->getNumResults() != 1) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "loop op is expected to have only one result";
      return diag;
    }
    OpBuilder builder(initOp);
    ArrayRef<int64_t> numThreads = loopOp.getStaticUpperBound();
    int64_t totalNumThread = 1;
    for (int64_t numThread : numThreads) {
      if (ShapedType::isDynamic(numThread)) {
        DiagnosedSilenceableFailure diag =
            emitSilenceableError()
            << "All the thread numbers are expected to be constant int.";
        return diag;
      }
      totalNumThread *= numThread;
    }
    SmallVector<int64_t> replicaGroup(totalNumThread);
    std::iota(replicaGroup.begin(), replicaGroup.end(), 0);
    ArrayAttr replicaGroupAttrs =
        builder.getArrayAttr({builder.getI64ArrayAttr(replicaGroup)});

    BlockArgument loopOutBlockArg = loopOp.getOutputBlockArguments()[0];
    if (!all_of(loopOutBlockArg.getUsers(), [](Operation *op) {
          return isa<tensor::ExtractSliceOp, tensor::ParallelInsertSliceOp>(op);
        })) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError() << "all the users of loop op's block arg are "
                                    "expected to be tensor.extract_slice or "
                                    "tensor.parallel_insert_slice";
      return diag;
    }
    Block *block = &loopOp.getRegion().front();
    auto parallelOp = cast<scf::InParallelOp>(block->getTerminator());
    SmallVector<tensor::ParallelInsertSliceOp> parallelInsertSliceOps =
        llvm::to_vector(parallelOp.getOps<tensor::ParallelInsertSliceOp>());
    if (parallelInsertSliceOps.size() != 1) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "only one tensor.parallel_insert_slice op is expected in the "
             "region of scf.in_parallel op";
      return diag;
    }

    // figure out the all-reduce type
    StringAttr reduceType = getAllReduceType(mergeOp, initOp);
    if (!reduceType) {
      DiagnosedSilenceableFailure diag = emitSilenceableError()
                                         << "fail to get reduce type";
      return diag;
    }

    // create new init op, reset the types and replace all the uses
    ShapedType retType = mergeOp->getResult(0).getType().dyn_cast<ShapedType>();
    if (!retType) {
      DiagnosedSilenceableFailure diag =
          emitSilenceableError()
          << "merge op's result is expected to be ShapedType";
      return diag;
    }
    tensor::EmptyOp emptyOp = builder.create<tensor::EmptyOp>(
        initOp.getLoc(), retType.getShape(), retType.getElementType());
    linalg::FillOp newFillOp = builder.create<linalg::FillOp>(
        initOp.getLoc(), initOp.getInputs(), emptyOp.getResult());
    MutableOperandRange loopOutputs = loopOp.getOutputsMutable();
    loopOutputs.assign(newFillOp.getResultTensors());
    loopOp->getResult(0).setType(mergeOp->getResult(0).getType());
    loopOutBlockArg.setType(mergeOp->getResult(0).getType());
    for (Operation *op : loopOutBlockArg.getUsers()) {
      if (isa<tensor::ExtractSliceOp>(op)) {
        op->getResult(0).replaceAllUsesWith(loopOutBlockArg);
        op->erase();
      }
    }

    // create cll.all_reduce op
    Value retVal = parallelInsertSliceOps[0].getSource();
    SmallVector<Value> retVals;
    Block *parallelBlock = &parallelOp.getRegion().front();
    parallelBlock->clear();
    builder.setInsertionPointAfterValue(retVal);
    auto allReduceOp = builder.create<ccl::AllReduceOp>(
        retVal.getLoc(), retVal, /*dynamic_replica_groups*/ nullptr, reduceType,
        /*replica_groups*/ replicaGroupAttrs, /*unique_id*/ nullptr);

    // create new merge op
    SmallVector<AffineMap> maps;
    MLIRContext *ctx = loopOp.getContext();
    maps.append(2, AffineMap::getMultiDimIdentityMap(retType.getRank(), ctx));
    SmallVector<Value> newMergeInputs;
    SmallVector<Value> newMergeOutputs;
    newMergeInputs.push_back(allReduceOp.getResult());
    newMergeOutputs.push_back(mergeOp.getOutputs()[0]);
    linalg::GenericOp finalMergeOp = builder.create<linalg::GenericOp>(
        mergeOp->getLoc(), mergeOp->getResultTypes()[0], newMergeInputs,
        newMergeOutputs, maps, getNParallelLoopsAttrs(retType.getRank()));
    Region &region = finalMergeOp.getRegion();
    region.takeBody(mergeOp.getRegion());

    // create tensor.parallel_insert_slice op
    builder.setInsertionPoint(parallelBlock, parallelBlock->begin());
    int64_t rank = retType.getRank();
    SmallVector<OpFoldResult> offsets(rank, builder.getIndexAttr(0));
    SmallVector<OpFoldResult> sizes;
    for (int64_t dimSize : retType.getShape())
      sizes.push_back(builder.getIndexAttr(dimSize));
    SmallVector<OpFoldResult> strides(rank, builder.getIndexAttr(1));
    builder.create<tensor::ParallelInsertSliceOp>(
        retVal.getLoc(), finalMergeOp->getResult(0),
        loopOp.getOutputBlockArguments()[0], offsets, sizes, strides);

    // replace all uses of original merge op
    mergeOp->getResult(0).replaceAllUsesWith(loopOp->getResult(0));
    mergeOp->erase();

    newFillOps.push_back(newFillOp);
    newLoopOps.push_back(loopOp);
  }
  transformResults.set(getNewInit().cast<OpResult>(), newFillOps);
  transformResults.set(getNewLoop().cast<OpResult>(), newLoopOps);
  return DiagnosedSilenceableFailure::success();
}

ParseResult SharedOutputToDistributedStyleOp::parse(OpAsmParser &parser,
                                                    OperationState &result) {
  OpAsmParser::UnresolvedOperand loop;
  OpAsmParser::UnresolvedOperand init;
  OpAsmParser::UnresolvedOperand merge;
  auto pdlOperationType = pdl::OperationType::get(parser.getContext());

  if (parser.parseOperand(loop) ||
      parser.resolveOperand(loop, pdlOperationType, result.operands) ||
      parser.parseComma() || parser.parseOperand(init) ||
      parser.resolveOperand(init, pdlOperationType, result.operands) ||
      parser.parseComma() || parser.parseOperand(merge) ||
      parser.resolveOperand(merge, pdlOperationType, result.operands))
    return ParseResult::failure();

  result.addTypes(SmallVector<Type>(2, pdlOperationType));
  return success();
}

void SharedOutputToDistributedStyleOp::print(OpAsmPrinter &p) {
  p << ' ' << getLoop() << ", " << getInit() << ", " << getMerge();
}

void transform::SharedOutputToDistributedStyleOp::getEffects(
    SmallVectorImpl<MemoryEffects::EffectInstance> &effects) {
  consumesHandle(getLoop(), effects);
  consumesHandle(getInit(), effects);
  consumesHandle(getMerge(), effects);
  producesHandle(getNewLoop(), effects);
  producesHandle(getNewInit(), effects);
  modifiesPayload(effects);
}

//===----------------------------------------------------------------------===//
// Transform op registration
//===----------------------------------------------------------------------===//

namespace {
/// Registers new ops and declares PDL as dependent dialect since the
/// additional ops are using PDL types for operands and results.
class LinalgExtTransformDialectExtension
    : public transform::TransformDialectExtension<
          LinalgExtTransformDialectExtension> {
public:
  using Base::Base;

  void init() {
    // TODO remove unused ones
    declareDependentDialect<pdl::PDLDialect>();
    declareDependentDialect<LinalgDialect>();
    declareDependentDialect<LinalgExtDialect>();
    declareGeneratedDialect<AffineDialect>();
    declareGeneratedDialect<arith::ArithDialect>();
    declareGeneratedDialect<scf::SCFDialect>();
    declareGeneratedDialect<vector::VectorDialect>();
    declareGeneratedDialect<gpu::GPUDialect>();
    declareGeneratedDialect<ccl::CclDialect>();

    registerTransformOps<
#define GET_OP_LIST
#include "byteir/Dialect/Linalg/TransformOps/LinalgExtTransformOps.cpp.inc"
        >();
  }
};
} // namespace

#define GET_OP_CLASSES
#include "byteir/Dialect/Linalg/TransformOps/LinalgExtTransformOps.cpp.inc"

void mlir::linalg_ext::registerTransformDialectExtension(
    DialectRegistry &registry) {
  registry.addExtensions<LinalgExtTransformDialectExtension>();
}
