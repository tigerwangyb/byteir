//===- LayoutTransformation.cpp -------------------------------*--- C++ -*-===//
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

#include "byteir/Dialect/mhlo/Transforms/LayoutTransformation.h"

#include "byteir/Dialect/Byre/Common.h"
#include "byteir/Dialect/mhlo/Util/Util.h"
#include "byteir/Utils/Utils.h"
#include "mhlo/IR/hlo_ops.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/IR/Operation.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "./PassDetail.h"

using namespace mlir;
using namespace llvm;

namespace {

Value createNCHW2NHWCValue(PatternRewriter &rewriter, Location loc,
                           Value input) {
  auto inputType = input.getType().cast<RankedTensorType>();
  assert(inputType.getRank() == 4);
  auto shape = inputType.getShape();
  RankedTensorType newType = RankedTensorType::get(
      {shape[0], shape[2], shape[3], shape[1]}, inputType.getElementType());
  return rewriter.create<mhlo::TransposeOp>(
      loc, newType, input, rewriter.getI64TensorAttr({0, 2, 3, 1}));
}

Value createNHWC2NCHWValue(PatternRewriter &rewriter, Location loc,
                           Value input) {
  auto inputType = input.getType().cast<RankedTensorType>();
  assert(inputType.getRank() == 4);
  auto shape = inputType.getShape();
  RankedTensorType newType = RankedTensorType::get(
      {shape[0], shape[3], shape[1], shape[2]}, inputType.getElementType());
  return rewriter.create<mhlo::TransposeOp>(
      loc, newType, input, rewriter.getI64TensorAttr({0, 3, 1, 2}));
}

Value createHWCN2NHWCValue(PatternRewriter &rewriter, Location loc,
                           Value input) {
  auto inputType = input.getType().cast<RankedTensorType>();
  assert(inputType.getRank() == 4);
  auto shape = inputType.getShape();
  RankedTensorType newType = RankedTensorType::get(
      {shape[3], shape[0], shape[1], shape[2]}, inputType.getElementType());
  return rewriter.create<mhlo::TransposeOp>(
      loc, newType, input, rewriter.getI64TensorAttr({3, 0, 1, 2}));
}

RankedTensorType createNCHW2NHWCType(Type type) {
  auto rankedTy = type.cast<RankedTensorType>();
  assert(rankedTy.getRank() == 4);
  auto shape = rankedTy.getShape();
  return RankedTensorType::get({shape[0], shape[2], shape[3], shape[1]},
                               rankedTy.getElementType());
}

DenseIntElementsAttr createNCHW2NHWCAttr(PatternRewriter &rewriter,
                                         DenseIntElementsAttr attr) {
  if (!attr) {
    return attr;
  }
  auto values = attr.getValues<int64_t>();
  assert(values.size() == 4);
  return rewriter.getI64TensorAttr(
      {values[0], values[2], values[3], values[1]});
}

DenseIntElementsAttr createNCHW2NHWCAttr2(PatternRewriter &rewriter,
                                          DenseIntElementsAttr attr) {
  if (!attr) {
    return attr;
  }
  auto values = attr.getValues<int64_t>();
  assert(values.size() == 4 * 2);
  return getI64ElementsAttr({values[0], values[1], values[4], values[5],
                             values[6], values[7], values[2], values[3]},
                            {4, 2}, &rewriter);
}

Value createNCDHW2NDHWCValue(PatternRewriter &rewriter, Location loc,
                             Value input) {
  auto inputType = input.getType().cast<RankedTensorType>();
  assert(inputType.getRank() == 5);
  auto shape = inputType.getShape();
  RankedTensorType newType =
      RankedTensorType::get({shape[0], shape[2], shape[3], shape[4], shape[1]},
                            inputType.getElementType());
  return rewriter.create<mhlo::TransposeOp>(
      loc, newType, input, rewriter.getI64TensorAttr({0, 2, 3, 4, 1}));
}

Value createNDHWC2NCDHWValue(PatternRewriter &rewriter, Location loc,
                             Value input) {
  auto inputType = input.getType().cast<RankedTensorType>();
  assert(inputType.getRank() == 5);
  auto shape = inputType.getShape();
  RankedTensorType newType =
      RankedTensorType::get({shape[0], shape[4], shape[1], shape[2], shape[3]},
                            inputType.getElementType());
  return rewriter.create<mhlo::TransposeOp>(
      loc, newType, input, rewriter.getI64TensorAttr({0, 4, 1, 2, 3}));
}

RankedTensorType createNCDHW2NDHWCType(Type type) {
  auto rankedTy = type.cast<RankedTensorType>();
  assert(rankedTy.getRank() == 5);
  auto shape = rankedTy.getShape();
  return RankedTensorType::get(
      {shape[0], shape[2], shape[3], shape[4], shape[1]},
      rankedTy.getElementType());
}

DenseIntElementsAttr createNCDHW2NDHWCAttr(PatternRewriter &rewriter,
                                           DenseIntElementsAttr attr) {
  if (!attr) {
    return attr;
  }
  auto values = attr.getValues<int64_t>();
  assert(values.size() == 5);
  return rewriter.getI64TensorAttr(
      {values[0], values[2], values[3], values[4], values[1]});
}

DenseIntElementsAttr createNCDHW2NDHWCAttr2(PatternRewriter &rewriter,
                                            DenseIntElementsAttr attr) {
  if (!attr) {
    return attr;
  }
  auto values = attr.getValues<int64_t>();
  assert(values.size() == 5 * 2);
  return getI64ElementsAttr({values[0], values[1], values[4], values[5],
                             values[6], values[7], values[8], values[9],
                             values[2], values[3]},
                            {5, 2}, &rewriter);
}

struct ConvLayoutTransformationPattern
    : public OpRewritePattern<mhlo::ConvolutionOp> {
  ConvLayoutTransformationPattern(MLIRContext *context,
                                  std::string targetLayout)
      : OpRewritePattern<mhlo::ConvolutionOp>(context),
        targetLayout(targetLayout) {}

  LogicalResult matchAndRewrite(mhlo::ConvolutionOp op,
                                PatternRewriter &rewriter) const override {
    if (op->getParentOfType<mhlo::FusionOp>()) {
      return failure();
    }
    auto dimensionNumbers = op.getDimensionNumbers();
    auto convLayout = getConvLayout(dimensionNumbers);
    auto inputLayout = std::get<0>(convLayout);
    auto kernelLayout = std::get<1>(convLayout);
    auto outputLayout = std::get<2>(convLayout);

    if (targetLayout == "NHWC") {
      if (inputLayout == byteir::NamedLayout::NCHW &&
          kernelLayout == byteir::NamedLayout::NCHW &&
          outputLayout == byteir::NamedLayout::NCHW) {
        Value lhsTranspose =
            createNCHW2NHWCValue(rewriter, op->getLoc(), op.getLhs());
        Value rhsTranspose =
            createNCHW2NHWCValue(rewriter, op->getLoc(), op.getRhs());
        Type outputType = createNCHW2NHWCType(op.getResult().getType());
        auto newDimensionNumbers = mhlo::ConvDimensionNumbersAttr::get(
            rewriter.getContext(), 0, 3, {1, 2}, 3, 0, {1, 2}, 0, 3, {1, 2});
        auto newOp = rewriter.create<mhlo::ConvolutionOp>(
            op->getLoc(), outputType, lhsTranspose, rhsTranspose,
            op.getWindowStridesAttr(), op.getPaddingAttr(),
            op.getLhsDilationAttr(), op.getRhsDilationAttr(),
            op.getWindowReversalAttr(), newDimensionNumbers,
            op.getFeatureGroupCountAttr(), op.getBatchGroupCountAttr(),
            op.getPrecisionConfigAttr());
        Value outputTranspose =
            createNHWC2NCHWValue(rewriter, op->getLoc(), newOp.getResult());
        rewriter.replaceOp(op, outputTranspose);
        return success();
      } else if (inputLayout == byteir::NamedLayout::NHWC &&
                 kernelLayout == byteir::NamedLayout::HWCN &&
                 outputLayout == byteir::NamedLayout::NHWC) {
        Value rhsTranspose =
            createHWCN2NHWCValue(rewriter, op->getLoc(), op.getRhs());
        auto newDimensionNumbers = mhlo::ConvDimensionNumbersAttr::get(
            rewriter.getContext(), 0, 3, {1, 2}, 3, 0, {1, 2}, 0, 3, {1, 2});
        mhlo::ConvolutionOp newOp = rewriter.create<mhlo::ConvolutionOp>(
            op->getLoc(), op.getType(), op.getLhs(), rhsTranspose,
            op.getWindowStridesAttr(), op.getPaddingAttr(),
            op.getLhsDilationAttr(), op.getRhsDilationAttr(),
            op.getWindowReversalAttr(), newDimensionNumbers,
            op.getFeatureGroupCountAttr(), op.getBatchGroupCountAttr(),
            op.getPrecisionConfigAttr());
        rewriter.replaceOp(op, newOp.getResult());
        return success();
      }
    } else if (targetLayout == "NDHWC") {
      if (inputLayout == byteir::NamedLayout::NCDHW &&
          kernelLayout == byteir::NamedLayout::NCDHW &&
          outputLayout == byteir::NamedLayout::NCDHW) {
        Value lhsTranspose =
            createNCDHW2NDHWCValue(rewriter, op->getLoc(), op.getLhs());
        Value rhsTranspose =
            createNCDHW2NDHWCValue(rewriter, op->getLoc(), op.getRhs());
        Type outputType = createNCDHW2NDHWCType(op.getResult().getType());
        auto newDimensionNumbers = mhlo::ConvDimensionNumbersAttr::get(
            rewriter.getContext(), 0, 4, {1, 2, 3}, 4, 0, {1, 2, 3}, 0, 4,
            {1, 2, 3});
        auto newOp = rewriter.create<mhlo::ConvolutionOp>(
            op->getLoc(), outputType, lhsTranspose, rhsTranspose,
            op.getWindowStridesAttr(), op.getPaddingAttr(),
            op.getLhsDilationAttr(), op.getRhsDilationAttr(),
            op.getWindowReversalAttr(), newDimensionNumbers,
            op.getFeatureGroupCountAttr(), op.getBatchGroupCountAttr(),
            op.getPrecisionConfigAttr());
        Value outputTranspose =
            createNDHWC2NCDHWValue(rewriter, op->getLoc(), newOp.getResult());
        rewriter.replaceOp(op, outputTranspose);
        return success();
      }
    }
    return failure();
  }
  std::string targetLayout;
};

struct ConvBackwardLayoutTransformationPattern
    : public OpRewritePattern<mhlo::FusionOp> {
  ConvBackwardLayoutTransformationPattern(MLIRContext *context,
                                          std::string targetLayout)
      : OpRewritePattern<mhlo::FusionOp>(context), targetLayout(targetLayout) {}

  LogicalResult matchAndRewrite(mhlo::FusionOp op,
                                PatternRewriter &rewriter) const override {
    StringAttr computeName =
        op->getAttrOfType<StringAttr>(byre::getByreComputeName());
    if (!computeName) {
      return failure();
    }
    if (computeName.getValue() != "ConvBackwardDataOp" &&
        computeName.getValue() != "ConvBackwardFilterOp") {
      return failure();
    }
    auto inputLayout =
        op->getAttrOfType<StringAttr>(byre::getByrePrefix() + "input_layout")
            .getValue();
    auto kernelLayout =
        op->getAttrOfType<StringAttr>(byre::getByrePrefix() + "kernel_layout")
            .getValue();
    auto outputLayout =
        op->getAttrOfType<StringAttr>(byre::getByrePrefix() + "output_layout")
            .getValue();

    if (targetLayout == "NHWC") {
      if (inputLayout == "NCHW" && kernelLayout == "NCHW" &&
          outputLayout == "NCHW") {
        Value lhsTranspose =
            createNCHW2NHWCValue(rewriter, op->getLoc(), op->getOperand(0));
        Value rhsTranspose =
            createNCHW2NHWCValue(rewriter, op->getLoc(), op->getOperand(1));
        Value lhs = createNHWC2NCHWValue(rewriter, op->getLoc(), lhsTranspose);
        Value rhs = createNHWC2NCHWValue(rewriter, op->getLoc(), rhsTranspose);
        Type outputType = createNCHW2NHWCType(op->getResult(0).getType());
        auto newOp = rewriter.create<mhlo::FusionOp>(
            op->getLoc(), ArrayRef<Type>{outputType},
            ArrayRef<Value>{lhsTranspose, rhsTranspose}, op->getAttrs());
        newOp->setAttr(byre::getByrePrefix() + "input_layout",
                       rewriter.getStringAttr("NHWC"));
        newOp->setAttr(byre::getByrePrefix() + "kernel_layout",
                       rewriter.getStringAttr("NHWC"));
        newOp->setAttr(byre::getByrePrefix() + "output_layout",
                       rewriter.getStringAttr("NHWC"));
        Value outputTranspose =
            createNHWC2NCHWValue(rewriter, op->getLoc(), newOp->getResult(0));
        IRMapping bvm;
        bvm.map(op->getOperand(0), lhs);
        bvm.map(op->getOperand(1), rhs);
        op.getFusedComputation().cloneInto(&newOp.getFusedComputation(), bvm);
        Block &block = newOp.getFusedComputation().front();
        {
          for (auto &innerOp : block) {
            if (llvm::isa<mhlo::ReturnOp>(&innerOp)) {
              OpBuilder::InsertionGuard guard(rewriter);
              rewriter.setInsertionPoint(&innerOp);
              Value output = createNCHW2NHWCValue(rewriter, op->getLoc(),
                                                  innerOp.getOperand(0));
              innerOp.setOperand(0, output);
            }
          }
          rhs.getDefiningOp()->moveBefore(&block.front());
          lhs.getDefiningOp()->moveBefore(&block.front());
        }

        rewriter.replaceOp(op, outputTranspose);
        return success();
      }
    }
    return failure();
  }
  std::string targetLayout;
};

struct ReduceWindownLayoutTransformationPattern
    : public OpRewritePattern<mhlo::ReduceWindowOp> {
  ReduceWindownLayoutTransformationPattern(MLIRContext *context,
                                           std::string targetLayout)
      : OpRewritePattern<mhlo::ReduceWindowOp>(context),
        targetLayout(targetLayout) {}
  LogicalResult matchAndRewrite(mhlo::ReduceWindowOp op,
                                PatternRewriter &rewriter) const override {
    if (op->getParentOfType<mhlo::FusionOp>()) {
      return failure();
    }
    if (op.getInputs().size() != 1 || op.getInitValues().size() != 1 ||
        op->getResults().size() != 1) {
      return failure();
    }
    auto operand = *(op.getInputs().begin());
    auto layout = getPoolLayout(op);

    if (targetLayout == "NHWC" && layout == byteir::NamedLayout::NCHW) {
      Value operandTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), operand);
      Type outputType = createNCHW2NHWCType(op->getResults()[0].getType());
      auto newOp = rewriter.create<mhlo::ReduceWindowOp>(
          op->getLoc(), ArrayRef<Type>{outputType},
          ArrayRef<Value>{operandTranspose}, op.getInitValues(),
          createNCHW2NHWCAttr(rewriter, op.getWindowDimensionsAttr()),
          createNCHW2NHWCAttr(rewriter, op.getWindowStridesAttr()),
          createNCHW2NHWCAttr(rewriter, op.getBaseDilationsAttr()),
          createNCHW2NHWCAttr(rewriter, op.getWindowDilationsAttr()),
          createNCHW2NHWCAttr2(rewriter, op.getPaddingAttr()));
      // clone body
      IRMapping emptyBvm;
      op.getBody().cloneInto(&newOp.getBody(), emptyBvm);
      Value outputTranspose =
          createNHWC2NCHWValue(rewriter, op->getLoc(), newOp->getResults()[0]);
      rewriter.replaceOp(op, outputTranspose);
      return success();
    } else if (targetLayout == "NDHWC" &&
               layout == byteir::NamedLayout::NCDHW) {
      Value operandTranspose =
          createNCDHW2NDHWCValue(rewriter, op->getLoc(), operand);
      Type outputType = createNCDHW2NDHWCType(op->getResults()[0].getType());
      auto newOp = rewriter.create<mhlo::ReduceWindowOp>(
          op->getLoc(), ArrayRef<Type>{outputType},
          ArrayRef<Value>{operandTranspose}, op.getInitValues(),
          createNCDHW2NDHWCAttr(rewriter, op.getWindowDimensionsAttr()),
          createNCDHW2NDHWCAttr(rewriter, op.getWindowStridesAttr()),
          createNCDHW2NDHWCAttr(rewriter, op.getBaseDilationsAttr()),
          createNCDHW2NDHWCAttr(rewriter, op.getWindowDilationsAttr()),
          createNCDHW2NDHWCAttr2(rewriter, op.getPaddingAttr()));
      // clone body
      IRMapping emptyBvm;
      op.getBody().cloneInto(&newOp.getBody(), emptyBvm);
      Value outputTranspose = createNDHWC2NCDHWValue(rewriter, op->getLoc(),
                                                     newOp->getResults()[0]);
      rewriter.replaceOp(op, outputTranspose);
      return success();
    }
    return failure();
  }
  std::string targetLayout;
};

struct SelectAndScatterLayoutTransformationPattern
    : public OpRewritePattern<mhlo::SelectAndScatterOp> {
  SelectAndScatterLayoutTransformationPattern(MLIRContext *context,
                                              std::string targetLayout)
      : OpRewritePattern<mhlo::SelectAndScatterOp>(context),
        targetLayout(targetLayout) {}
  LogicalResult matchAndRewrite(mhlo::SelectAndScatterOp op,
                                PatternRewriter &rewriter) const override {
    if (op->getParentOfType<mhlo::FusionOp>()) {
      return failure();
    }
    auto layout = getPoolGradLayout(op);

    if (targetLayout == "NHWC" && layout == byteir::NamedLayout::NCHW) {
      Value operandTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), op.getOperand());
      Value sourceTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), op.getSource());
      Type outputType = createNCHW2NHWCType(op.getResult().getType());
      auto newOp = rewriter.create<mhlo::SelectAndScatterOp>(
          op->getLoc(), outputType, operandTranspose, sourceTranspose,
          op.getInitValue(),
          createNCHW2NHWCAttr(rewriter, op.getWindowDimensionsAttr()),
          createNCHW2NHWCAttr(rewriter, op.getWindowStridesAttr()),
          createNCHW2NHWCAttr2(rewriter, op.getPaddingAttr()));
      // clone body
      IRMapping emptyBvm;
      op.getSelect().cloneInto(&newOp.getSelect(), emptyBvm);
      op.getScatter().cloneInto(&newOp.getScatter(), emptyBvm);
      Value outputTranspose =
          createNHWC2NCHWValue(rewriter, op->getLoc(), newOp.getResult());
      rewriter.replaceOp(op, outputTranspose);
      return success();
    } else if (targetLayout == "NDHWC" &&
               layout == byteir::NamedLayout::NCDHW) {
      Value operandTranspose =
          createNCDHW2NDHWCValue(rewriter, op->getLoc(), op.getOperand());
      Value sourceTranspose =
          createNCDHW2NDHWCValue(rewriter, op->getLoc(), op.getSource());
      Type outputType = createNCDHW2NDHWCType(op.getResult().getType());
      auto newOp = rewriter.create<mhlo::SelectAndScatterOp>(
          op->getLoc(), outputType, operandTranspose, sourceTranspose,
          op.getInitValue(),
          createNCDHW2NDHWCAttr(rewriter, op.getWindowDimensionsAttr()),
          createNCDHW2NDHWCAttr(rewriter, op.getWindowStridesAttr()),
          createNCDHW2NDHWCAttr2(rewriter, op.getPaddingAttr()));
      // clone body
      IRMapping emptyBvm;
      op.getSelect().cloneInto(&newOp.getSelect(), emptyBvm);
      op.getScatter().cloneInto(&newOp.getScatter(), emptyBvm);
      Value outputTranspose =
          createNDHWC2NCDHWValue(rewriter, op->getLoc(), newOp.getResult());
      rewriter.replaceOp(op, outputTranspose);
      return success();
    }
    return failure();
  }
  std::string targetLayout;
};

struct BatchNormTrainingLayoutTransformationPattern
    : public OpRewritePattern<mhlo::BatchNormTrainingOp> {
  BatchNormTrainingLayoutTransformationPattern(MLIRContext *context,
                                               std::string targetLayout)
      : OpRewritePattern<mhlo::BatchNormTrainingOp>(context),
        targetLayout(targetLayout) {}

  LogicalResult matchAndRewrite(mhlo::BatchNormTrainingOp op,
                                PatternRewriter &rewriter) const override {
    if (op->getParentOfType<mhlo::FusionOp>()) {
      return failure();
    }
    auto inputType = op.getOperand().getType().cast<RankedTensorType>();
    if (targetLayout == "NHWC" && inputType.getRank() == 4 &&
        op.getFeatureIndex() == 1) {
      Value inputTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), op.getOperand());
      Type outputType = createNCHW2NHWCType(op.getOutput().getType());
      mhlo::BatchNormTrainingOp opTranspose =
          rewriter.create<mhlo::BatchNormTrainingOp>(
              op->getLoc(),
              ArrayRef<Type>{outputType, op.getBatchMean().getType(),
                             op.getBatchVar().getType()},
              inputTranspose, op.getScale(), op.getOffset(),
              op.getEpsilonAttr(), rewriter.getI64IntegerAttr(3));
      Value outputTranspose =
          createNHWC2NCHWValue(rewriter, op->getLoc(), opTranspose.getOutput());

      rewriter.replaceOp(op, {outputTranspose, opTranspose.getBatchMean(),
                              opTranspose.getBatchVar()});
      return success();
    } else {
      return failure();
    }
  }
  std::string targetLayout;
};

struct BatchNormGradLayoutTransformationPattern
    : public OpRewritePattern<mhlo::BatchNormGradOp> {
  BatchNormGradLayoutTransformationPattern(MLIRContext *context,
                                           std::string targetLayout)
      : OpRewritePattern<mhlo::BatchNormGradOp>(context),
        targetLayout(targetLayout) {}
  LogicalResult matchAndRewrite(mhlo::BatchNormGradOp op,
                                PatternRewriter &rewriter) const override {
    if (op->getParentOfType<mhlo::FusionOp>()) {
      return failure();
    }
    auto inputType = op.getOperand().getType().cast<RankedTensorType>();
    if (targetLayout == "NHWC" && inputType.getRank() == 4 &&
        op.getFeatureIndex() == 1) {
      Value operandTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), op.getOperand());
      Value gradOutputTranspose =
          createNCHW2NHWCValue(rewriter, op->getLoc(), op.getGradOutput());
      Type gradOperandType = createNCHW2NHWCType(op.getGradOperand().getType());
      mhlo::BatchNormGradOp opTranspose =
          rewriter.create<mhlo::BatchNormGradOp>(
              op->getLoc(),
              ArrayRef<Type>{gradOperandType, op.getGradScale().getType(),
                             op.getGradOffset().getType()},
              operandTranspose, op.getScale(), op.getMean(), op.getVariance(),
              gradOutputTranspose, op.getEpsilonAttr(),
              rewriter.getI64IntegerAttr(3));
      Value outputTranspose = createNHWC2NCHWValue(
          rewriter, op->getLoc(), opTranspose.getGradOperand());
      rewriter.replaceOp(op, {outputTranspose, opTranspose.getGradScale(),
                              opTranspose.getGradOffset()});
      return success();
    }
    return failure();
  }
  std::string targetLayout;
};

struct LayoutTransformationPass
    : LayoutTransformationBase<LayoutTransformationPass> {
  LayoutTransformationPass(std::string target_layout)
      : LayoutTransformationBase() {
    this->targetLayout = target_layout;
  }

  void runOnOperation() override {
    func::FuncOp funcOp = getOperation();
    if (this->targetLayout != "NHWC" && this->targetLayout != "NDHWC") {
      funcOp.emitError(
          "LayoutTransformationPass doesn't support target layout: ")
          << this->targetLayout;
      return signalPassFailure();
    }

    RewritePatternSet patterns(funcOp.getContext());
    populateLayoutTransformationPattern(patterns, this->targetLayout);
    FrozenRewritePatternSet frozenPatterns(std::move(patterns));
    if (failed(applyPatternsAndFoldGreedily(funcOp, frozenPatterns))) {
      funcOp.emitError("LayoutTransformationPass applyPatternsAndFoldGreedily "
                       "does not converge");
      signalPassFailure();
    }
  }
};
} // namespace

void mlir::populateLayoutTransformationPattern(RewritePatternSet &patterns,
                                               std::string targetLayout) {
  // clang-format off
  patterns.add<ConvLayoutTransformationPattern,
               ConvBackwardLayoutTransformationPattern,
               ReduceWindownLayoutTransformationPattern,
               SelectAndScatterLayoutTransformationPattern,
               BatchNormTrainingLayoutTransformationPattern,
               BatchNormGradLayoutTransformationPattern>(patterns.getContext(),
                                                         targetLayout);
  // clang-format on
}

std::unique_ptr<OperationPass<func::FuncOp>>
mlir::createLayoutTransformationPass(std::string target_layout) {
  return std::make_unique<LayoutTransformationPass>(target_layout);
}