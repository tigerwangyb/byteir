// RUN: byteir-opt %s -scf-opt | FileCheck %s

// CHECK-LABEL: func.func @main

#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map6 = affine_map<() -> ()>
module @IrToMhlo.2452 {
  func.func private @Unknown0(%arg0: memref<4x3x224x224xf32>) -> memref<4x3x224x224xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4x3x224x224xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x3x224x224xf32>) outs(%alloc : memref<4x3x224x224xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x3x224x224xf16>
  }
  func.func private @Unknown1(%arg0: memref<64x3x7x7xf32>) -> memref<64x3x7x7xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x3x7x7xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x3x7x7xf32>) outs(%alloc : memref<64x3x7x7xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<64x3x7x7xf16>
  }
  func.func private @BatchNormTrainingOp2(%arg0: memref<4x64x112x112xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> memref<4x64x112x112xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x64x112x112xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x64x112x112xf16>, memref<4x64x112x112xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x112x112xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x112x112xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x112x112xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x64x112x112xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x64x112x112xf32>, memref<4x64x112x112xf16>) -> ()
    return %alloc_3 : memref<4x64x112x112xf16>
  }
  func.func private @Unknown3(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf32>) outs(%alloc : memref<64x64x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @Unknown4(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf32>) outs(%alloc : memref<64x64x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @Unknown5(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf32>) outs(%alloc : memref<64x64x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @Unknown6(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf32>) outs(%alloc : memref<64x64x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @Unknown7(%arg0: memref<128x64x1x1xf32>) -> memref<128x64x1x1xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x64x1x1xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x64x1x1xf32>) outs(%alloc : memref<128x64x1x1xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<128x64x1x1xf16>
  }
  func.func private @Unknown8(%arg0: memref<128x64x3x3xf32>) -> memref<128x64x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x64x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x64x3x3xf32>) outs(%alloc : memref<128x64x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<128x64x3x3xf16>
  }
  func.func private @Unknown9(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf32>) outs(%alloc : memref<128x128x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @Unknown10(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf32>) outs(%alloc : memref<128x128x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @Unknown11(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf32>) outs(%alloc : memref<128x128x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @Unknown12(%arg0: memref<256x128x1x1xf32>) -> memref<256x128x1x1xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x128x1x1xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x128x1x1xf32>) outs(%alloc : memref<256x128x1x1xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<256x128x1x1xf16>
  }
  func.func private @Unknown13(%arg0: memref<256x128x3x3xf32>) -> memref<256x128x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x128x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x128x3x3xf32>) outs(%alloc : memref<256x128x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<256x128x3x3xf16>
  }
  func.func private @Unknown14(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf32>) outs(%alloc : memref<256x256x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @Unknown15(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf32>) outs(%alloc : memref<256x256x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @Unknown16(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf32>) outs(%alloc : memref<256x256x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @Unknown17(%arg0: memref<512x256x1x1xf32>) -> memref<512x256x1x1xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x256x1x1xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x256x1x1xf32>) outs(%alloc : memref<512x256x1x1xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<512x256x1x1xf16>
  }
  func.func private @Unknown18(%arg0: memref<512x256x3x3xf32>) -> memref<512x256x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x256x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x256x3x3xf32>) outs(%alloc : memref<512x256x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<512x256x3x3xf16>
  }
  func.func private @Unknown19(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf32>) outs(%alloc : memref<512x512x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @Unknown20(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf32>) outs(%alloc : memref<512x512x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @Unknown21(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf32>) outs(%alloc : memref<512x512x3x3xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @Unknown22(%arg0: memref<4x1000xf32>) -> memref<4x1000xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant -2.500000e-01 : f32
    %alloc = memref.alloc() : memref<4x1000xf16>
    linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : memref<4x1000xf32>) outs(%alloc : memref<4x1000xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.mulf %in, %cst : f32
      %1 = arith.truncf %0 : f32 to f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x1000xf16>
  }
  func.func private @Unknown23(%arg0: memref<1000x512xf32>) -> memref<1000x512xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<1000x512xf16>
    linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : memref<1000x512xf32>) outs(%alloc : memref<1000x512xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<1000x512xf16>
  }
  func.func private @Unknown24(%arg0: memref<1000xf32>) -> memref<1000xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<1000xf16>
    linalg.generic {indexing_maps = [#map2, #map2], iterator_types = ["parallel"]} ins(%arg0 : memref<1000xf32>) outs(%alloc : memref<1000xf16>) {
    ^bb0(%in: f32, %out: f16):
      %0 = arith.truncf %in : f32 to f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<1000xf16>
  }
  func.func private @Unknown25(%arg0: memref<4x64x112x112xf16>) -> (memref<4x64x112x112xf16>, memref<4x64x112x112xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x112x112xf16>
    %alloc_0 = memref.alloc() : memref<4x64x112x112xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x64x112x112xf16>) outs(%alloc, %alloc_0 : memref<4x64x112x112xf16>, memref<4x64x112x112xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x64x112x112xf16>, memref<4x64x112x112xi1>
  }
  func.func private @BatchNormTrainingOp26(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> memref<4x64x56x56xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_3 : memref<4x64x56x56xf16>
  }
  func.func private @Unknown27(%arg0: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    %alloc_0 = memref.alloc() : memref<4x64x56x56xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x64x56x56xf16>) outs(%alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
  }
  func.func private @BatchNormTrainingOp28(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> memref<4x64x56x56xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_3 : memref<4x64x56x56xf16>
  }
  func.func private @Unknown29(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    %alloc_0 = memref.alloc() : memref<4x64x56x56xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) outs(%alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
  }
  func.func private @BatchNormTrainingOp30(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> memref<4x64x56x56xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_3 : memref<4x64x56x56xf16>
  }
  func.func private @Unknown31(%arg0: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    %alloc_0 = memref.alloc() : memref<4x64x56x56xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x64x56x56xf16>) outs(%alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
  }
  func.func private @BatchNormTrainingOp32(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> memref<4x64x56x56xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_3 : memref<4x64x56x56xf16>
  }
  func.func private @Unknown33(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    %alloc_0 = memref.alloc() : memref<4x64x56x56xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) outs(%alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
  }
  func.func private @BatchNormTrainingOp34(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> memref<4x128x28x28xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_3 : memref<4x128x28x28xf16>
  }
  func.func private @BatchNormTrainingOp35(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> memref<4x128x28x28xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_3 : memref<4x128x28x28xf16>
  }
  func.func private @Unknown36(%arg0: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    %alloc_0 = memref.alloc() : memref<4x128x28x28xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x128x28x28xf16>) outs(%alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
  }
  func.func private @BatchNormTrainingOp37(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> memref<4x128x28x28xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_3 : memref<4x128x28x28xf16>
  }
  func.func private @Unknown38(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    %alloc_0 = memref.alloc() : memref<4x128x28x28xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) outs(%alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
  }
  func.func private @BatchNormTrainingOp39(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> memref<4x128x28x28xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_3 : memref<4x128x28x28xf16>
  }
  func.func private @Unknown40(%arg0: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    %alloc_0 = memref.alloc() : memref<4x128x28x28xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x128x28x28xf16>) outs(%alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
  }
  func.func private @BatchNormTrainingOp41(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> memref<4x128x28x28xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_3 : memref<4x128x28x28xf16>
  }
  func.func private @Unknown42(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    %alloc_0 = memref.alloc() : memref<4x128x28x28xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) outs(%alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
  }
  func.func private @BatchNormTrainingOp43(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> memref<4x256x14x14xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_3 : memref<4x256x14x14xf16>
  }
  func.func private @BatchNormTrainingOp44(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> memref<4x256x14x14xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_3 : memref<4x256x14x14xf16>
  }
  func.func private @Unknown45(%arg0: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    %alloc_0 = memref.alloc() : memref<4x256x14x14xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x256x14x14xf16>) outs(%alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
  }
  func.func private @BatchNormTrainingOp46(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> memref<4x256x14x14xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_3 : memref<4x256x14x14xf16>
  }
  func.func private @Unknown47(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    %alloc_0 = memref.alloc() : memref<4x256x14x14xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) outs(%alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
  }
  func.func private @BatchNormTrainingOp48(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> memref<4x256x14x14xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_3 : memref<4x256x14x14xf16>
  }
  func.func private @Unknown49(%arg0: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    %alloc_0 = memref.alloc() : memref<4x256x14x14xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x256x14x14xf16>) outs(%alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
  }
  func.func private @BatchNormTrainingOp50(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> memref<4x256x14x14xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_3 : memref<4x256x14x14xf16>
  }
  func.func private @Unknown51(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    %alloc_0 = memref.alloc() : memref<4x256x14x14xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) outs(%alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
  }
  func.func private @BatchNormTrainingOp52(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> memref<4x512x7x7xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_3 : memref<4x512x7x7xf16>
  }
  func.func private @BatchNormTrainingOp53(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> memref<4x512x7x7xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_3 : memref<4x512x7x7xf16>
  }
  func.func private @Unknown54(%arg0: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    %alloc_0 = memref.alloc() : memref<4x512x7x7xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x512x7x7xf16>) outs(%alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
  }
  func.func private @BatchNormTrainingOp55(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> memref<4x512x7x7xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_3 : memref<4x512x7x7xf16>
  }
  func.func private @Unknown56(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    %alloc_0 = memref.alloc() : memref<4x512x7x7xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) outs(%alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
  }
  func.func private @BatchNormTrainingOp57(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> memref<4x512x7x7xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_3 : memref<4x512x7x7xf16>
  }
  func.func private @Unknown58(%arg0: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    %alloc_0 = memref.alloc() : memref<4x512x7x7xi1>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<4x512x7x7xf16>) outs(%alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) {
    ^bb0(%in: f16, %out: f16, %out_1: i1):
      %0 = arith.maxf %in, %cst : f16
      %1 = arith.cmpf ogt, %0, %cst : f16
      linalg.yield %0, %1 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
  }
  func.func private @BatchNormTrainingOp59(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> memref<4x512x7x7xf16> attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_3 : memref<4x512x7x7xf16>
  }
  func.func private @Unknown60(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    %alloc_0 = memref.alloc() : memref<4x512x7x7xi1>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) outs(%alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: i1):
      %0 = arith.addf %in, %in_1 : f16
      %1 = arith.maxf %0, %cst : f16
      %2 = arith.cmpf ogt, %1, %cst : f16
      linalg.yield %1, %2 : f16, i1
    }
    return %alloc, %alloc_0 : memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
  }
  func.func private @Unknown61(%arg0: memref<4x512xf16>) -> memref<4x512xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 2.040100e-02 : f16
    %alloc = memref.alloc() : memref<4x512xf16>
    linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : memref<4x512xf16>) outs(%alloc : memref<4x512xf16>) {
    ^bb0(%in: f16, %out: f16):
      %0 = arith.mulf %in, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x512xf16>
  }
  func.func private @Unknown62(%arg0: memref<1000xf16>, %arg1: memref<4x1000xf16>) -> memref<4x1000xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4x1000xf16>
    linalg.generic {indexing_maps = [#map1, #map3, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1, %arg0 : memref<4x1000xf16>, memref<1000xf16>) outs(%alloc : memref<4x1000xf16>) {
    ^bb0(%in: f16, %in_0: f16, %out: f16):
      %0 = arith.addf %in, %in_0 : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x1000xf16>
  }
  func.func private @Unknown63(%arg0: memref<4xf16>, %arg1: memref<4x1000xf16>) -> (memref<4x1000xf16>, memref<4x1000xf16>) attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4x1000xf16>
    %alloc_0 = memref.alloc() : memref<4x1000xf16>
    linalg.generic {indexing_maps = [#map1, #map4, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg1, %arg0 : memref<4x1000xf16>, memref<4xf16>) outs(%alloc, %alloc_0 : memref<4x1000xf16>, memref<4x1000xf16>) {
    ^bb0(%in: f16, %in_1: f16, %out: f16, %out_2: f16):
      %0 = arith.subf %in, %in_1 : f16
      %1 = math.exp %0 : f16
      linalg.yield %0, %1 : f16, f16
    }
    return %alloc, %alloc_0 : memref<4x1000xf16>, memref<4x1000xf16>
  }
  func.func private @Unknown64(%arg0: memref<4xf16>) -> memref<4xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4xf16>
    linalg.generic {indexing_maps = [#map2, #map2], iterator_types = ["parallel"]} ins(%arg0 : memref<4xf16>) outs(%alloc : memref<4xf16>) {
    ^bb0(%in: f16, %out: f16):
      %0 = math.log %in : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4xf16>
  }
  func.func private @Unknown65(%arg0: memref<4xf16>, %arg1: memref<4x1000xf16>, %arg2: memref<4xf16>, %arg3: memref<4x1000xf16>, %arg4: memref<4x1000xf32>) -> (memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf32>) attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4x1000xf16>
    %alloc_0 = memref.alloc() : memref<4x1000xf32>
    %alloc_1 = memref.alloc() : memref<4x1000xf32>
    linalg.generic {indexing_maps = [#map1, #map1, #map4, #map4, #map1, #map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg3, %arg1, %arg0, %arg2, %arg4 : memref<4x1000xf16>, memref<4x1000xf16>, memref<4xf16>, memref<4xf16>, memref<4x1000xf32>) outs(%alloc, %alloc_0, %alloc_1 : memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf32>) {
    ^bb0(%in: f16, %in_2: f16, %in_3: f16, %in_4: f16, %in_5: f32, %out: f16, %out_6: f32, %out_7: f32):
      %0 = arith.subf %in_2, %in_3 : f16
      %1 = math.exp %0 : f16
      %2 = arith.mulf %1, %in_4 : f16
      %3 = arith.subf %in, %2 : f16
      %4 = arith.extf %0 : f16 to f32
      %5 = arith.mulf %4, %in_5 : f32
      %6 = arith.extf %3 : f16 to f32
      linalg.yield %3, %5, %6 : f16, f32, f32
    }
    return %alloc, %alloc_0, %alloc_1 : memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf32>
  }
  func.func private @Unknown66(%arg0: memref<4x512xf16>, %arg1: memref<4x512x7x7xi1>) -> memref<4x512x7x7xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %cst_0 = arith.constant 4.900000e+01 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    linalg.generic {indexing_maps = [#map, #map5, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg1, %arg0 : memref<4x512x7x7xi1>, memref<4x512xf16>) outs(%alloc : memref<4x512x7x7xf16>) {
    ^bb0(%in: i1, %in_1: f16, %out: f16):
      %0 = arith.divf %in_1, %cst_0 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x512x7x7xf16>
  }
  func.func private @BatchNormGradOp67(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<512xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<512xf32>} : (memref<512xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_3 = memref.alloc() : memref<512xf32>
    %alloc_4 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @ConvBackwardDataOp68(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<512x512x3x3xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<3x3x512x512xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<3x3x512x512xf16>, memref<4x512x7x7xf16>) -> ()
    return %alloc_1 : memref<4x512x7x7xf16>
  }
  func.func private @ConvBackwardFilterOp69(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<512x512x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[512,512,3,3]{0,1,3,2}"} : (memref<3x3x512x512xf16>, memref<512x512x3x3xf16>) -> ()
    return %alloc_0 : memref<512x512x3x3xf16>
  }
  func.func private @Unknown70(%arg0: memref<4x512x7x7xi1>, %arg1: memref<4x512x7x7xf16>) -> memref<4x512x7x7xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x512x7x7xi1>, memref<4x512x7x7xf16>) outs(%alloc : memref<4x512x7x7xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x512x7x7xf16>
  }
  func.func private @BatchNormGradOp71(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<512xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<512xf32>} : (memref<512xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_3 = memref.alloc() : memref<512xf32>
    %alloc_4 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @ConvBackwardDataOp72(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<512x512x3x3xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<3x3x512x512xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<3x3x512x512xf16>, memref<4x512x7x7xf16>) -> ()
    return %alloc_1 : memref<4x512x7x7xf16>
  }
  func.func private @ConvBackwardFilterOp73(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<512x512x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[512,512,3,3]{0,1,3,2}"} : (memref<3x3x512x512xf16>, memref<512x512x3x3xf16>) -> ()
    return %alloc_0 : memref<512x512x3x3xf16>
  }
  func.func private @Unknown74(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xi1>) -> memref<4x512x7x7xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x512x7x7xi1>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) outs(%alloc : memref<4x512x7x7xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x512x7x7xf16>
  }
  func.func private @BatchNormGradOp75(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<512xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<512xf32>} : (memref<512xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_3 = memref.alloc() : memref<512xf32>
    %alloc_4 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @ConvBackwardDataOp76(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<512x512x3x3xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x512x512xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,512,512]{1,0,2,3}"} : (memref<3x3x512x512xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<3x3x512x512xf16>, memref<4x512x7x7xf16>) -> ()
    return %alloc_1 : memref<4x512x7x7xf16>
  }
  func.func private @ConvBackwardFilterOp77(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x512x512xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<3x3x512x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<512x512x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[512,512,3,3]{0,1,3,2}"} : (memref<3x3x512x512xf16>, memref<512x512x3x3xf16>) -> ()
    return %alloc_0 : memref<512x512x3x3xf16>
  }
  func.func private @Unknown78(%arg0: memref<4x512x7x7xi1>, %arg1: memref<4x512x7x7xf16>) -> memref<4x512x7x7xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x512x7x7xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x512x7x7xi1>, memref<4x512x7x7xf16>) outs(%alloc : memref<4x512x7x7xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x512x7x7xf16>
  }
  func.func private @BatchNormGradOp79(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<512xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<512xf32>} : (memref<512xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_3 = memref.alloc() : memref<512xf32>
    %alloc_4 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @ConvBackwardDataOp80(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512x256x3x3xf16>) -> memref<4x256x14x14xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x256x512xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,256,512]{1,0,2,3}"} : (memref<512x256x3x3xf16>, memref<3x3x256x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x256x512xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,256,512]{1,0,2,3}"} : (memref<3x3x256x512xf16>, memref<3x3x256x512xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 2], [1, 2]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<3x3x256x512xf16>, memref<4x256x14x14xf16>) -> ()
    return %alloc_1 : memref<4x256x14x14xf16>
  }
  func.func private @ConvBackwardFilterOp81(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x512x7x7xf16>) -> memref<512x256x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x256x512xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 0], [1, 0]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<4x512x7x7xf16>, memref<3x3x256x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<512x256x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[512,256,3,3]{0,1,3,2}"} : (memref<3x3x256x512xf16>, memref<512x256x3x3xf16>) -> ()
    return %alloc_0 : memref<512x256x3x3xf16>
  }
  func.func private @BatchNormGradOp82(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<512xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<512xf32>} : (memref<512xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x512x7x7xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x512x7x7xf32>
    %alloc_3 = memref.alloc() : memref<512xf32>
    %alloc_4 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf32>, memref<4x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x512x7x7xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x512x7x7xf32>, memref<4x512x7x7xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @ConvBackwardDataOp83(%arg0: memref<4x512x7x7xf16>, %arg1: memref<512x256x1x1xf16>) -> memref<4x256x14x14xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<1x1x256x512xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[1,1,256,512]{1,0,2,3}"} : (memref<512x256x1x1xf16>, memref<1x1x256x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%arg0, %alloc, %alloc_0) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[0, 1], [0, 1]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<1x1x256x512xf16>, memref<4x256x14x14xf16>) -> ()
    return %alloc_0 : memref<4x256x14x14xf16>
  }
  func.func private @ConvBackwardFilterOp84(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x512x7x7xf16>) -> memref<512x256x1x1xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<1x1x256x512xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[0, -1], [0, -1]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<4x512x7x7xf16>, memref<1x1x256x512xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<512x256x1x1xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[512,256,1,1]{0,1,3,2}"} : (memref<1x1x256x512xf16>, memref<512x256x1x1xf16>) -> ()
    return %alloc_0 : memref<512x256x1x1xf16>
  }
  func.func private @Unknown85(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>) -> memref<4x256x14x14xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) outs(%alloc : memref<4x256x14x14xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x256x14x14xf16>
  }
  func.func private @BatchNormGradOp86(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<256xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<256xf32>} : (memref<256xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_3 = memref.alloc() : memref<256xf32>
    %alloc_4 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @ConvBackwardDataOp87(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<256x256x3x3xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<3x3x256x256xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<3x3x256x256xf16>, memref<4x256x14x14xf16>) -> ()
    return %alloc_1 : memref<4x256x14x14xf16>
  }
  func.func private @ConvBackwardFilterOp88(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<256x256x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[256,256,3,3]{0,1,3,2}"} : (memref<3x3x256x256xf16>, memref<256x256x3x3xf16>) -> ()
    return %alloc_0 : memref<256x256x3x3xf16>
  }
  func.func private @Unknown89(%arg0: memref<4x256x14x14xi1>, %arg1: memref<4x256x14x14xf16>) -> memref<4x256x14x14xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>) outs(%alloc : memref<4x256x14x14xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x256x14x14xf16>
  }
  func.func private @BatchNormGradOp90(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<256xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<256xf32>} : (memref<256xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_3 = memref.alloc() : memref<256xf32>
    %alloc_4 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @ConvBackwardDataOp91(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<256x256x3x3xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<3x3x256x256xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<3x3x256x256xf16>, memref<4x256x14x14xf16>) -> ()
    return %alloc_1 : memref<4x256x14x14xf16>
  }
  func.func private @ConvBackwardFilterOp92(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<256x256x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[256,256,3,3]{0,1,3,2}"} : (memref<3x3x256x256xf16>, memref<256x256x3x3xf16>) -> ()
    return %alloc_0 : memref<256x256x3x3xf16>
  }
  func.func private @Unknown93(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>) -> memref<4x256x14x14xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) outs(%alloc : memref<4x256x14x14xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x256x14x14xf16>
  }
  func.func private @BatchNormGradOp94(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<256xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<256xf32>} : (memref<256xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_3 = memref.alloc() : memref<256xf32>
    %alloc_4 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @ConvBackwardDataOp95(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<256x256x3x3xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x256x256xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,256,256]{1,0,2,3}"} : (memref<3x3x256x256xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<3x3x256x256xf16>, memref<4x256x14x14xf16>) -> ()
    return %alloc_1 : memref<4x256x14x14xf16>
  }
  func.func private @ConvBackwardFilterOp96(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x256x256xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<3x3x256x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<256x256x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[256,256,3,3]{0,1,3,2}"} : (memref<3x3x256x256xf16>, memref<256x256x3x3xf16>) -> ()
    return %alloc_0 : memref<256x256x3x3xf16>
  }
  func.func private @Unknown97(%arg0: memref<4x256x14x14xi1>, %arg1: memref<4x256x14x14xf16>) -> memref<4x256x14x14xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x256x14x14xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>) outs(%alloc : memref<4x256x14x14xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x256x14x14xf16>
  }
  func.func private @BatchNormGradOp98(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<256xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<256xf32>} : (memref<256xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_3 = memref.alloc() : memref<256xf32>
    %alloc_4 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @ConvBackwardDataOp99(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256x128x3x3xf16>) -> memref<4x128x28x28xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x128x256xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,128,256]{1,0,2,3}"} : (memref<256x128x3x3xf16>, memref<3x3x128x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x128x256xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,128,256]{1,0,2,3}"} : (memref<3x3x128x256xf16>, memref<3x3x128x256xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 2], [1, 2]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<3x3x128x256xf16>, memref<4x128x28x28xf16>) -> ()
    return %alloc_1 : memref<4x128x28x28xf16>
  }
  func.func private @ConvBackwardFilterOp100(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x256x14x14xf16>) -> memref<256x128x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x128x256xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 0], [1, 0]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<4x256x14x14xf16>, memref<3x3x128x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<256x128x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[256,128,3,3]{0,1,3,2}"} : (memref<3x3x128x256xf16>, memref<256x128x3x3xf16>) -> ()
    return %alloc_0 : memref<256x128x3x3xf16>
  }
  func.func private @BatchNormGradOp101(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<256xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<256xf32>} : (memref<256xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x256x14x14xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x256x14x14xf32>
    %alloc_3 = memref.alloc() : memref<256xf32>
    %alloc_4 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf32>, memref<4x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x256x14x14xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x256x14x14xf32>, memref<4x256x14x14xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @ConvBackwardDataOp102(%arg0: memref<4x256x14x14xf16>, %arg1: memref<256x128x1x1xf16>) -> memref<4x128x28x28xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<1x1x128x256xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[1,1,128,256]{1,0,2,3}"} : (memref<256x128x1x1xf16>, memref<1x1x128x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%arg0, %alloc, %alloc_0) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[0, 1], [0, 1]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<1x1x128x256xf16>, memref<4x128x28x28xf16>) -> ()
    return %alloc_0 : memref<4x128x28x28xf16>
  }
  func.func private @ConvBackwardFilterOp103(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x256x14x14xf16>) -> memref<256x128x1x1xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<1x1x128x256xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[0, -1], [0, -1]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<4x256x14x14xf16>, memref<1x1x128x256xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<256x128x1x1xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[256,128,1,1]{0,1,3,2}"} : (memref<1x1x128x256xf16>, memref<256x128x1x1xf16>) -> ()
    return %alloc_0 : memref<256x128x1x1xf16>
  }
  func.func private @Unknown104(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>) -> memref<4x128x28x28xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) outs(%alloc : memref<4x128x28x28xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x128x28x28xf16>
  }
  func.func private @BatchNormGradOp105(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<128xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<128xf32>} : (memref<128xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    %alloc_4 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @ConvBackwardDataOp106(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<128x128x3x3xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<3x3x128x128xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<3x3x128x128xf16>, memref<4x128x28x28xf16>) -> ()
    return %alloc_1 : memref<4x128x28x28xf16>
  }
  func.func private @ConvBackwardFilterOp107(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<128x128x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[128,128,3,3]{0,1,3,2}"} : (memref<3x3x128x128xf16>, memref<128x128x3x3xf16>) -> ()
    return %alloc_0 : memref<128x128x3x3xf16>
  }
  func.func private @Unknown108(%arg0: memref<4x128x28x28xi1>, %arg1: memref<4x128x28x28xf16>) -> memref<4x128x28x28xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>) outs(%alloc : memref<4x128x28x28xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x128x28x28xf16>
  }
  func.func private @BatchNormGradOp109(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<128xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<128xf32>} : (memref<128xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    %alloc_4 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @ConvBackwardDataOp110(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<128x128x3x3xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<3x3x128x128xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<3x3x128x128xf16>, memref<4x128x28x28xf16>) -> ()
    return %alloc_1 : memref<4x128x28x28xf16>
  }
  func.func private @ConvBackwardFilterOp111(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<128x128x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[128,128,3,3]{0,1,3,2}"} : (memref<3x3x128x128xf16>, memref<128x128x3x3xf16>) -> ()
    return %alloc_0 : memref<128x128x3x3xf16>
  }
  func.func private @Unknown112(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>) -> memref<4x128x28x28xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) outs(%alloc : memref<4x128x28x28xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x128x28x28xf16>
  }
  func.func private @BatchNormGradOp113(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<128xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<128xf32>} : (memref<128xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    %alloc_4 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @ConvBackwardDataOp114(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<128x128x3x3xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x128x128xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,128,128]{1,0,2,3}"} : (memref<3x3x128x128xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<3x3x128x128xf16>, memref<4x128x28x28xf16>) -> ()
    return %alloc_1 : memref<4x128x28x28xf16>
  }
  func.func private @ConvBackwardFilterOp115(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x128x128xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<3x3x128x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<128x128x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[128,128,3,3]{0,1,3,2}"} : (memref<3x3x128x128xf16>, memref<128x128x3x3xf16>) -> ()
    return %alloc_0 : memref<128x128x3x3xf16>
  }
  func.func private @Unknown116(%arg0: memref<4x128x28x28xi1>, %arg1: memref<4x128x28x28xf16>) -> memref<4x128x28x28xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x128x28x28xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>) outs(%alloc : memref<4x128x28x28xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x128x28x28xf16>
  }
  func.func private @BatchNormGradOp117(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<128xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<128xf32>} : (memref<128xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    %alloc_4 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @ConvBackwardDataOp118(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128x64x3x3xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x64x128xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,64,128]{1,0,2,3}"} : (memref<128x64x3x3xf16>, memref<3x3x64x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x64x128xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,64,128]{1,0,2,3}"} : (memref<3x3x64x128xf16>, memref<3x3x64x128xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 2], [1, 2]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<3x3x64x128xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_1 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp119(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x128x28x28xf16>) -> memref<128x64x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x64x128xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 0], [1, 0]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x128x28x28xf16>, memref<3x3x64x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<128x64x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[128,64,3,3]{0,1,3,2}"} : (memref<3x3x64x128xf16>, memref<128x64x3x3xf16>) -> ()
    return %alloc_0 : memref<128x64x3x3xf16>
  }
  func.func private @BatchNormGradOp120(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<128xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<128xf32>} : (memref<128xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x128x28x28xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x128x28x28xf32>
    %alloc_3 = memref.alloc() : memref<128xf32>
    %alloc_4 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf32>, memref<4x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x128x28x28xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x128x28x28xf32>, memref<4x128x28x28xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @ConvBackwardDataOp121(%arg0: memref<4x128x28x28xf16>, %arg1: memref<128x64x1x1xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<1x1x64x128xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[1,1,64,128]{1,0,2,3}"} : (memref<128x64x1x1xf16>, memref<1x1x64x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc, %alloc_0) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[0, 1], [0, 1]], lhs_dilate = [2, 2], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<1x1x64x128xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_0 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp122(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x128x28x28xf16>) -> memref<128x64x1x1xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<0> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<1x1x64x128xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[0, -1], [0, -1]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x128x28x28xf16>, memref<1x1x64x128xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<128x64x1x1xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[128,64,1,1]{0,1,3,2}"} : (memref<1x1x64x128xf16>, memref<128x64x1x1xf16>) -> ()
    return %alloc_0 : memref<128x64x1x1xf16>
  }
  func.func private @Unknown123(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>) -> memref<4x64x56x56xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) outs(%alloc : memref<4x64x56x56xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x64x56x56xf16>
  }
  func.func private @BatchNormGradOp124(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<64xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<64xf32>} : (memref<64xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_3 = memref.alloc() : memref<64xf32>
    %alloc_4 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @ConvBackwardDataOp125(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<64x64x3x3xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<3x3x64x64xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<3x3x64x64xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_1 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp126(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<64x64x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[64,64,3,3]{0,1,3,2}"} : (memref<3x3x64x64xf16>, memref<64x64x3x3xf16>) -> ()
    return %alloc_0 : memref<64x64x3x3xf16>
  }
  func.func private @Unknown127(%arg0: memref<4x64x56x56xi1>, %arg1: memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>) outs(%alloc : memref<4x64x56x56xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x64x56x56xf16>
  }
  func.func private @BatchNormGradOp128(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<64xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<64xf32>} : (memref<64xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_3 = memref.alloc() : memref<64xf32>
    %alloc_4 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @ConvBackwardDataOp129(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<64x64x3x3xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<3x3x64x64xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<3x3x64x64xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_1 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp130(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<64x64x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[64,64,3,3]{0,1,3,2}"} : (memref<3x3x64x64xf16>, memref<64x64x3x3xf16>) -> ()
    return %alloc_0 : memref<64x64x3x3xf16>
  }
  func.func private @Unknown131(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>) -> memref<4x64x56x56xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    linalg.generic {indexing_maps = [#map, #map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg2, %arg0, %arg1 : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) outs(%alloc : memref<4x64x56x56xf16>) {
    ^bb0(%in: i1, %in_0: f16, %in_1: f16, %out: f16):
      %0 = arith.addf %in_0, %in_1 : f16
      %1 = arith.select %in, %0, %cst : f16
      linalg.yield %1 : f16
    }
    return %alloc : memref<4x64x56x56xf16>
  }
  func.func private @BatchNormGradOp132(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<64xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<64xf32>} : (memref<64xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_3 = memref.alloc() : memref<64xf32>
    %alloc_4 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @ConvBackwardDataOp133(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<64x64x3x3xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<3x3x64x64xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<3x3x64x64xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_1 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp134(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<64x64x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[64,64,3,3]{0,1,3,2}"} : (memref<3x3x64x64xf16>, memref<64x64x3x3xf16>) -> ()
    return %alloc_0 : memref<64x64x3x3xf16>
  }
  func.func private @Unknown135(%arg0: memref<4x64x56x56xi1>, %arg1: memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>) outs(%alloc : memref<4x64x56x56xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x64x56x56xf16>
  }
  func.func private @BatchNormGradOp136(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<64xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<64xf32>} : (memref<64xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x64x56x56xf32>
    %alloc_3 = memref.alloc() : memref<64xf32>
    %alloc_4 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf32>, memref<4x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x64x56x56xf32>, memref<4x64x56x56xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @ConvBackwardDataOp137(%arg0: memref<4x64x56x56xf16>, %arg1: memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardDataOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.transpose"(%arg1, %alloc) {permutation = dense<[2, 3, 1, 0]> : tensor<4xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<64x64x3x3xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<3x3x64x64xf16>
    "lmhlo.reverse"(%alloc, %alloc_0) {dimensions = dense<[0, 1]> : tensor<2xi64>, xla_shape = "f16[3,3,64,64]{1,0,2,3}"} : (memref<3x3x64x64xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%arg0, %alloc_0, %alloc_1) dim_numbers = [b, f, 0, 1]x[0, 1, o, i]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<3x3x64x64xf16>, memref<4x64x56x56xf16>) -> ()
    return %alloc_1 : memref<4x64x56x56xf16>
  }
  func.func private @ConvBackwardFilterOp138(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<1> : tensor<4xi64>, __byre__window_strides = dense<1> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<3x3x64x64xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<3x3x64x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<64x64x3x3xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[64,64,3,3]{0,1,3,2}"} : (memref<3x3x64x64xf16>, memref<64x64x3x3xf16>) -> ()
    return %alloc_0 : memref<64x64x3x3xf16>
  }
  func.func private @Unknown139(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<4x64x56x56xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) outs(%alloc : memref<4x64x56x56xf16>) {
    ^bb0(%in: f16, %in_0: f16, %out: f16):
      %0 = arith.addf %in, %in_0 : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x64x56x56xf16>
  }
  func.func private @Unknown140(%arg0: memref<4x64x112x112xi1>, %arg1: memref<4x64x112x112xf16>) -> memref<4x64x112x112xf16> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 0.000000e+00 : f16
    %alloc = memref.alloc() : memref<4x64x112x112xf16>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : memref<4x64x112x112xi1>, memref<4x64x112x112xf16>) outs(%alloc : memref<4x64x112x112xf16>) {
    ^bb0(%in: i1, %in_0: f16, %out: f16):
      %0 = arith.select %in, %in_0, %cst : f16
      linalg.yield %0 : f16
    }
    return %alloc : memref<4x64x112x112xf16>
  }
  func.func private @BatchNormGradOp141(%arg0: memref<4x64x112x112xf16>, %arg1: memref<64xf32>, %arg2: memref<4x64x112x112xf16>) -> (memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormGradOp"} {
    %alloc = memref.alloc() : memref<64xf32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<64xf32>} : (memref<64xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<4x64x112x112xf32>
    "lmhlo.convert"(%arg0, %alloc_0) : (memref<4x64x112x112xf16>, memref<4x64x112x112xf32>) -> ()
    %alloc_1 = memref.alloc() : memref<4x64x112x112xf32>
    "lmhlo.convert"(%arg2, %alloc_1) : (memref<4x64x112x112xf16>, memref<4x64x112x112xf32>) -> ()
    %alloc_2 = memref.alloc() : memref<4x64x112x112xf32>
    %alloc_3 = memref.alloc() : memref<64xf32>
    %alloc_4 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_grad"(%alloc_0, %arg1, %alloc, %alloc, %alloc_1, %alloc_2, %alloc_3, %alloc_4) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<4x64x112x112xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<4x64x112x112xf32>, memref<4x64x112x112xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x112x112xf16>
    "lmhlo.convert"(%alloc_2, %alloc_5) : (memref<4x64x112x112xf32>, memref<4x64x112x112xf16>) -> ()
    return %alloc_5, %alloc_3, %alloc_4 : memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @ConvBackwardFilterOp142(%arg0: memref<4x3x224x224xf16>, %arg1: memref<4x64x112x112xf16>) -> memref<64x3x7x7xf16> attributes {__byre__batch_group_count = 1 : i64, __byre__feature_group_count = 1 : i64, __byre__input_layout = "NCHW", __byre__kernel_layout = "NCHW", __byre__output_layout = "NCHW", __byre__padding = dense<3> : tensor<4xi64>, __byre__window_strides = dense<2> : tensor<2xi64>, byre_compute_name = "ConvBackwardFilterOp"} {
    %alloc = memref.alloc() : memref<7x7x3x64xf16>
    lmhlo.convolution(%arg0, %arg1, %alloc) dim_numbers = [f, b, 0, 1]x[i, o, 0, 1]->[0, 1, b, f], window = {stride = [1, 1], pad = [[3, 2], [3, 2]], lhs_dilate = [1, 1], rhs_dilate = [2, 2]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x3x224x224xf16>, memref<4x64x112x112xf16>, memref<7x7x3x64xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<64x3x7x7xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[3, 2, 0, 1]> : tensor<4xi64>, xla_shape = "f16[64,3,7,7]{0,1,3,2}"} : (memref<7x7x3x64xf16>, memref<64x3x7x7xf16>) -> ()
    return %alloc_0 : memref<64x3x7x7xf16>
  }
  func.func private @Unknown143(%arg0: memref<f32>) -> memref<f32> attributes {__byteir_elementwise_fusion__} {
    %cst = arith.constant 4.000000e+00 : f32
    %alloc = memref.alloc() : memref<f32>
    linalg.generic {indexing_maps = [#map6, #map6], iterator_types = []} ins(%arg0 : memref<f32>) outs(%alloc : memref<f32>) {
    ^bb0(%in: f32, %out: f32):
      %0 = arith.negf %in : f32
      %1 = arith.divf %0, %cst : f32
      linalg.yield %1 : f32
    }
    return %alloc : memref<f32>
  }
  func.func private @Unknown144(%arg0: memref<64x3x7x7xf16>) -> memref<64x3x7x7xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x3x7x7xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x3x7x7xf16>) outs(%alloc : memref<64x3x7x7xf32>) attrs =  {xla_shape = "f32[64,3,7,7]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<64x3x7x7xf32>
  }
  func.func private @Unknown145(%arg0: memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf16>) outs(%alloc : memref<64x64x3x3xf32>) attrs =  {xla_shape = "f32[64,64,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<64x64x3x3xf32>
  }
  func.func private @Unknown146(%arg0: memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf16>) outs(%alloc : memref<64x64x3x3xf32>) attrs =  {xla_shape = "f32[64,64,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<64x64x3x3xf32>
  }
  func.func private @Unknown147(%arg0: memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf16>) outs(%alloc : memref<64x64x3x3xf32>) attrs =  {xla_shape = "f32[64,64,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<64x64x3x3xf32>
  }
  func.func private @Unknown148(%arg0: memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<64x64x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<64x64x3x3xf16>) outs(%alloc : memref<64x64x3x3xf32>) attrs =  {xla_shape = "f32[64,64,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<64x64x3x3xf32>
  }
  func.func private @Unknown149(%arg0: memref<128x64x3x3xf16>) -> memref<128x64x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x64x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x64x3x3xf16>) outs(%alloc : memref<128x64x3x3xf32>) attrs =  {xla_shape = "f32[128,64,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<128x64x3x3xf32>
  }
  func.func private @Unknown150(%arg0: memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf16>) outs(%alloc : memref<128x128x3x3xf32>) attrs =  {xla_shape = "f32[128,128,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<128x128x3x3xf32>
  }
  func.func private @Unknown151(%arg0: memref<128x64x1x1xf16>) -> memref<128x64x1x1xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x64x1x1xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x64x1x1xf16>) outs(%alloc : memref<128x64x1x1xf32>) attrs =  {xla_shape = "f32[128,64,1,1]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<128x64x1x1xf32>
  }
  func.func private @Unknown152(%arg0: memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf16>) outs(%alloc : memref<128x128x3x3xf32>) attrs =  {xla_shape = "f32[128,128,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<128x128x3x3xf32>
  }
  func.func private @Unknown153(%arg0: memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<128x128x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<128x128x3x3xf16>) outs(%alloc : memref<128x128x3x3xf32>) attrs =  {xla_shape = "f32[128,128,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<128x128x3x3xf32>
  }
  func.func private @Unknown154(%arg0: memref<256x128x3x3xf16>) -> memref<256x128x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x128x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x128x3x3xf16>) outs(%alloc : memref<256x128x3x3xf32>) attrs =  {xla_shape = "f32[256,128,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<256x128x3x3xf32>
  }
  func.func private @Unknown155(%arg0: memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf16>) outs(%alloc : memref<256x256x3x3xf32>) attrs =  {xla_shape = "f32[256,256,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<256x256x3x3xf32>
  }
  func.func private @Unknown156(%arg0: memref<256x128x1x1xf16>) -> memref<256x128x1x1xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x128x1x1xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x128x1x1xf16>) outs(%alloc : memref<256x128x1x1xf32>) attrs =  {xla_shape = "f32[256,128,1,1]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<256x128x1x1xf32>
  }
  func.func private @Unknown157(%arg0: memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf16>) outs(%alloc : memref<256x256x3x3xf32>) attrs =  {xla_shape = "f32[256,256,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<256x256x3x3xf32>
  }
  func.func private @Unknown158(%arg0: memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<256x256x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<256x256x3x3xf16>) outs(%alloc : memref<256x256x3x3xf32>) attrs =  {xla_shape = "f32[256,256,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<256x256x3x3xf32>
  }
  func.func private @Unknown159(%arg0: memref<512x256x3x3xf16>) -> memref<512x256x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x256x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x256x3x3xf16>) outs(%alloc : memref<512x256x3x3xf32>) attrs =  {xla_shape = "f32[512,256,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<512x256x3x3xf32>
  }
  func.func private @Unknown160(%arg0: memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf16>) outs(%alloc : memref<512x512x3x3xf32>) attrs =  {xla_shape = "f32[512,512,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<512x512x3x3xf32>
  }
  func.func private @Unknown161(%arg0: memref<512x256x1x1xf16>) -> memref<512x256x1x1xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x256x1x1xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x256x1x1xf16>) outs(%alloc : memref<512x256x1x1xf32>) attrs =  {xla_shape = "f32[512,256,1,1]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<512x256x1x1xf32>
  }
  func.func private @Unknown162(%arg0: memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf16>) outs(%alloc : memref<512x512x3x3xf32>) attrs =  {xla_shape = "f32[512,512,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<512x512x3x3xf32>
  }
  func.func private @Unknown163(%arg0: memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<512x512x3x3xf32>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%arg0 : memref<512x512x3x3xf16>) outs(%alloc : memref<512x512x3x3xf32>) attrs =  {xla_shape = "f32[512,512,3,3]{0,1,3,2}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<512x512x3x3xf32>
  }
  func.func private @MatmulOp164(%arg0: memref<4x512xf16>, %arg1: memref<4x1000xf16>) -> memref<1000x512xf16> attributes {__byre__lhs_contracting_dimension = 0 : i64, __byre__output_transpose, __byre__rhs_contracting_dimension = 0 : i64, byre_compute_name = "MatmulOp"} {
    %alloc = memref.alloc() : memref<512x1000xf16>
    "lmhlo.dot"(%arg0, %arg1, %alloc) {dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [0], rhs_contracting_dimensions = [0]>, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512xf16>, memref<4x1000xf16>, memref<512x1000xf16>) -> ()
    %alloc_0 = memref.alloc() : memref<1000x512xf16>
    "lmhlo.transpose"(%alloc, %alloc_0) {permutation = dense<[1, 0]> : tensor<2xi64>, xla_shape = "f16[1000,512]{0,1}"} : (memref<512x1000xf16>, memref<1000x512xf16>) -> ()
    return %alloc_0 : memref<1000x512xf16>
  }
  func.func private @Unknown165(%arg0: memref<1000x512xf16>) -> memref<1000x512xf32> attributes {__byteir_elementwise_fusion__} {
    %alloc = memref.alloc() : memref<1000x512xf32>
    linalg.generic {indexing_maps = [#map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : memref<1000x512xf16>) outs(%alloc : memref<1000x512xf32>) attrs =  {xla_shape = "f32[1000,512]{0,1}"} {
    ^bb0(%in: f16, %out: f32):
      %0 = arith.extf %in : f16 to f32
      linalg.yield %0 : f32
    }
    return %alloc : memref<1000x512xf32>
  }
  func.func @main(%arg0: memref<4x3x224x224xf32>, %arg1: memref<4x1000xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<64xf32>, %arg4: memref<64xf32>, %arg5: memref<64xf32>, %arg6: memref<64xf32>, %arg7: memref<64x64x3x3xf32>, %arg8: memref<64xf32>, %arg9: memref<64xf32>, %arg10: memref<64xf32>, %arg11: memref<64xf32>, %arg12: memref<64x64x3x3xf32>, %arg13: memref<64xf32>, %arg14: memref<64xf32>, %arg15: memref<64xf32>, %arg16: memref<64xf32>, %arg17: memref<64x64x3x3xf32>, %arg18: memref<64xf32>, %arg19: memref<64xf32>, %arg20: memref<64xf32>, %arg21: memref<64xf32>, %arg22: memref<64x64x3x3xf32>, %arg23: memref<64xf32>, %arg24: memref<64xf32>, %arg25: memref<64xf32>, %arg26: memref<64xf32>, %arg27: memref<128x64x3x3xf32>, %arg28: memref<128xf32>, %arg29: memref<128xf32>, %arg30: memref<128xf32>, %arg31: memref<128xf32>, %arg32: memref<128x128x3x3xf32>, %arg33: memref<128xf32>, %arg34: memref<128xf32>, %arg35: memref<128xf32>, %arg36: memref<128xf32>, %arg37: memref<128x64x1x1xf32>, %arg38: memref<128xf32>, %arg39: memref<128xf32>, %arg40: memref<128xf32>, %arg41: memref<128xf32>, %arg42: memref<128x128x3x3xf32>, %arg43: memref<128xf32>, %arg44: memref<128xf32>, %arg45: memref<128xf32>, %arg46: memref<128xf32>, %arg47: memref<128x128x3x3xf32>, %arg48: memref<128xf32>, %arg49: memref<128xf32>, %arg50: memref<128xf32>, %arg51: memref<128xf32>, %arg52: memref<256x128x3x3xf32>, %arg53: memref<256xf32>, %arg54: memref<256xf32>, %arg55: memref<256xf32>, %arg56: memref<256xf32>, %arg57: memref<256x256x3x3xf32>, %arg58: memref<256xf32>, %arg59: memref<256xf32>, %arg60: memref<256xf32>, %arg61: memref<256xf32>, %arg62: memref<256x128x1x1xf32>, %arg63: memref<256xf32>, %arg64: memref<256xf32>, %arg65: memref<256xf32>, %arg66: memref<256xf32>, %arg67: memref<256x256x3x3xf32>, %arg68: memref<256xf32>, %arg69: memref<256xf32>, %arg70: memref<256xf32>, %arg71: memref<256xf32>, %arg72: memref<256x256x3x3xf32>, %arg73: memref<256xf32>, %arg74: memref<256xf32>, %arg75: memref<256xf32>, %arg76: memref<256xf32>, %arg77: memref<512x256x3x3xf32>, %arg78: memref<512xf32>, %arg79: memref<512xf32>, %arg80: memref<512xf32>, %arg81: memref<512xf32>, %arg82: memref<512x512x3x3xf32>, %arg83: memref<512xf32>, %arg84: memref<512xf32>, %arg85: memref<512xf32>, %arg86: memref<512xf32>, %arg87: memref<512x256x1x1xf32>, %arg88: memref<512xf32>, %arg89: memref<512xf32>, %arg90: memref<512xf32>, %arg91: memref<512xf32>, %arg92: memref<512x512x3x3xf32>, %arg93: memref<512xf32>, %arg94: memref<512xf32>, %arg95: memref<512xf32>, %arg96: memref<512xf32>, %arg97: memref<512x512x3x3xf32>, %arg98: memref<512xf32>, %arg99: memref<512xf32>, %arg100: memref<512xf32>, %arg101: memref<512xf32>, %arg102: memref<1000x512xf32>, %arg103: memref<1000xf32>) -> (memref<f32>, memref<64x3x7x7xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<128x64x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x64x1x1xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<256x128x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x128x1x1xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<512x256x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x256x1x1xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<1000x512xf32>, memref<1000xf32>) {
    %alloc = memref.alloc() : memref<f32>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<f32>} : (memref<f32>) -> ()
    %alloc_0 = memref.alloc() : memref<f16>
    "lmhlo.constant"(%alloc_0) {value = dense<0.000000e+00> : tensor<f16>} : (memref<f16>) -> ()
    %alloc_1 = memref.alloc() : memref<f16>
    "lmhlo.constant"(%alloc_1) {value = dense<0xFC00> : tensor<f16>} : (memref<f16>) -> ()
    %0 = call @Unknown0(%arg0) : (memref<4x3x224x224xf32>) -> memref<4x3x224x224xf16>
    %1 = call @Unknown1(%arg2) : (memref<64x3x7x7xf32>) -> memref<64x3x7x7xf16>
    %alloc_2 = memref.alloc() : memref<4x64x112x112xf16>
    lmhlo.convolution(%0, %1, %alloc_2) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[3, 3], [3, 3]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x3x224x224xf16>, memref<64x3x7x7xf16>, memref<4x64x112x112xf16>) -> ()
    %2 = call @BatchNormTrainingOp2(%alloc_2, %arg3, %arg4) : (memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>) -> memref<4x64x112x112xf16>
    %3 = call @Unknown3(%arg7) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %4 = call @Unknown4(%arg12) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %5 = call @Unknown5(%arg17) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %6 = call @Unknown6(%arg22) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %7 = call @Unknown7(%arg37) : (memref<128x64x1x1xf32>) -> memref<128x64x1x1xf16>
    %8 = call @Unknown8(%arg27) : (memref<128x64x3x3xf32>) -> memref<128x64x3x3xf16>
    %9 = call @Unknown9(%arg32) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %10 = call @Unknown10(%arg42) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %11 = call @Unknown11(%arg47) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %12 = call @Unknown12(%arg62) : (memref<256x128x1x1xf32>) -> memref<256x128x1x1xf16>
    %13 = call @Unknown13(%arg52) : (memref<256x128x3x3xf32>) -> memref<256x128x3x3xf16>
    %14 = call @Unknown14(%arg57) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %15 = call @Unknown15(%arg67) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %16 = call @Unknown16(%arg72) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %17 = call @Unknown17(%arg87) : (memref<512x256x1x1xf32>) -> memref<512x256x1x1xf16>
    %18 = call @Unknown18(%arg77) : (memref<512x256x3x3xf32>) -> memref<512x256x3x3xf16>
    %19 = call @Unknown19(%arg82) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %20 = call @Unknown20(%arg92) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %21 = call @Unknown21(%arg97) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %22 = call @Unknown22(%arg1) : (memref<4x1000xf32>) -> memref<4x1000xf16>
    %23 = call @Unknown23(%arg102) : (memref<1000x512xf32>) -> memref<1000x512xf16>
    %24 = call @Unknown24(%arg103) : (memref<1000xf32>) -> memref<1000xf16>
    %alloc_3 = memref.alloc() : memref<4xf16>
    "lmhlo.reduce"(%22, %alloc_0, %alloc_3) ({
    ^bb0(%arg104: memref<f16>, %arg105: memref<f16>, %arg106: memref<f16>):
      "lmhlo.add"(%arg104, %arg105, %arg106) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<1> : tensor<1xi64>} : (memref<4x1000xf16>, memref<f16>, memref<4xf16>) -> ()
    %25:2 = call @Unknown25(%2) : (memref<4x64x112x112xf16>) -> (memref<4x64x112x112xf16>, memref<4x64x112x112xi1>)
    %alloc_4 = memref.alloc() : memref<4x64x56x56xf16>
    "lmhlo.reduce_window"(%25#0, %alloc_1, %alloc_4) ({
    ^bb0(%arg104: memref<f16>, %arg105: memref<f16>, %arg106: memref<f16>):
      %alloc_32 = memref.alloc() : memref<f16>
      "lmhlo.maximum"(%arg104, %arg105, %alloc_32) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.copy"(%alloc_32, %arg106) : (memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {base_dilations = dense<1> : tensor<4xi64>, padding = dense<[[0, 0], [0, 0], [1, 1], [1, 1]]> : tensor<4x2xi64>, window_dilations = dense<1> : tensor<4xi64>, window_dimensions = dense<[1, 1, 3, 3]> : tensor<4xi64>, window_strides = dense<[1, 1, 2, 2]> : tensor<4xi64>} : (memref<4x64x112x112xf16>, memref<f16>, memref<4x64x56x56xf16>) -> ()
    %alloc_5 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%alloc_4, %3, %alloc_5) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>) -> ()
    %26 = call @BatchNormTrainingOp26(%alloc_5, %arg8, %arg9) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> memref<4x64x56x56xf16>
    %27:2 = call @Unknown27(%26) : (memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>)
    %alloc_6 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%27#0, %4, %alloc_6) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>) -> ()
    %28 = call @BatchNormTrainingOp28(%alloc_6, %arg13, %arg14) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> memref<4x64x56x56xf16>
    %29:2 = call @Unknown29(%28, %alloc_4) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>)
    %alloc_7 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%29#0, %5, %alloc_7) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>) -> ()
    %30 = call @BatchNormTrainingOp30(%alloc_7, %arg18, %arg19) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> memref<4x64x56x56xf16>
    %31:2 = call @Unknown31(%30) : (memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>)
    %alloc_8 = memref.alloc() : memref<4x64x56x56xf16>
    lmhlo.convolution(%31#0, %6, %alloc_8) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>) -> ()
    %32 = call @BatchNormTrainingOp32(%alloc_8, %arg23, %arg24) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> memref<4x64x56x56xf16>
    %33:2 = call @Unknown33(%32, %29#0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<4x64x56x56xi1>)
    %alloc_9 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%33#0, %7, %alloc_9) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<128x64x1x1xf16>, memref<4x128x28x28xf16>) -> ()
    %34 = call @BatchNormTrainingOp34(%alloc_9, %arg38, %arg39) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> memref<4x128x28x28xf16>
    %alloc_10 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%33#0, %8, %alloc_10) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x64x56x56xf16>, memref<128x64x3x3xf16>, memref<4x128x28x28xf16>) -> ()
    %35 = call @BatchNormTrainingOp35(%alloc_10, %arg28, %arg29) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> memref<4x128x28x28xf16>
    %36:2 = call @Unknown36(%35) : (memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>)
    %alloc_11 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%36#0, %9, %alloc_11) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>) -> ()
    %37 = call @BatchNormTrainingOp37(%alloc_11, %arg33, %arg34) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> memref<4x128x28x28xf16>
    %38:2 = call @Unknown38(%37, %34) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>)
    %alloc_12 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%38#0, %10, %alloc_12) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>) -> ()
    %39 = call @BatchNormTrainingOp39(%alloc_12, %arg43, %arg44) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> memref<4x128x28x28xf16>
    %40:2 = call @Unknown40(%39) : (memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>)
    %alloc_13 = memref.alloc() : memref<4x128x28x28xf16>
    lmhlo.convolution(%40#0, %11, %alloc_13) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>) -> ()
    %41 = call @BatchNormTrainingOp41(%alloc_13, %arg48, %arg49) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> memref<4x128x28x28xf16>
    %42:2 = call @Unknown42(%41, %38#0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<4x128x28x28xi1>)
    %alloc_14 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%42#0, %12, %alloc_14) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<256x128x1x1xf16>, memref<4x256x14x14xf16>) -> ()
    %43 = call @BatchNormTrainingOp43(%alloc_14, %arg63, %arg64) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> memref<4x256x14x14xf16>
    %alloc_15 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%42#0, %13, %alloc_15) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x128x28x28xf16>, memref<256x128x3x3xf16>, memref<4x256x14x14xf16>) -> ()
    %44 = call @BatchNormTrainingOp44(%alloc_15, %arg53, %arg54) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> memref<4x256x14x14xf16>
    %45:2 = call @Unknown45(%44) : (memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>)
    %alloc_16 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%45#0, %14, %alloc_16) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>) -> ()
    %46 = call @BatchNormTrainingOp46(%alloc_16, %arg58, %arg59) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> memref<4x256x14x14xf16>
    %47:2 = call @Unknown47(%46, %43) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>)
    %alloc_17 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%47#0, %15, %alloc_17) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>) -> ()
    %48 = call @BatchNormTrainingOp48(%alloc_17, %arg68, %arg69) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> memref<4x256x14x14xf16>
    %49:2 = call @Unknown49(%48) : (memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>)
    %alloc_18 = memref.alloc() : memref<4x256x14x14xf16>
    lmhlo.convolution(%49#0, %16, %alloc_18) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>) -> ()
    %50 = call @BatchNormTrainingOp50(%alloc_18, %arg73, %arg74) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> memref<4x256x14x14xf16>
    %51:2 = call @Unknown51(%50, %47#0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<4x256x14x14xi1>)
    %alloc_19 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%51#0, %17, %alloc_19) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<512x256x1x1xf16>, memref<4x512x7x7xf16>) -> ()
    %52 = call @BatchNormTrainingOp52(%alloc_19, %arg88, %arg89) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> memref<4x512x7x7xf16>
    %alloc_20 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%51#0, %18, %alloc_20) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x256x14x14xf16>, memref<512x256x3x3xf16>, memref<4x512x7x7xf16>) -> ()
    %53 = call @BatchNormTrainingOp53(%alloc_20, %arg78, %arg79) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> memref<4x512x7x7xf16>
    %54:2 = call @Unknown54(%53) : (memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>)
    %alloc_21 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%54#0, %19, %alloc_21) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>) -> ()
    %55 = call @BatchNormTrainingOp55(%alloc_21, %arg83, %arg84) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> memref<4x512x7x7xf16>
    %56:2 = call @Unknown56(%55, %52) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>)
    %alloc_22 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%56#0, %20, %alloc_22) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>) -> ()
    %57 = call @BatchNormTrainingOp57(%alloc_22, %arg93, %arg94) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> memref<4x512x7x7xf16>
    %58:2 = call @Unknown58(%57) : (memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>)
    %alloc_23 = memref.alloc() : memref<4x512x7x7xf16>
    lmhlo.convolution(%58#0, %21, %alloc_23) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>) -> ()
    %59 = call @BatchNormTrainingOp59(%alloc_23, %arg98, %arg99) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> memref<4x512x7x7xf16>
    %60:2 = call @Unknown60(%59, %56#0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<4x512x7x7xi1>)
    %alloc_24 = memref.alloc() : memref<4x512xf16>
    "lmhlo.reduce"(%60#0, %alloc_0, %alloc_24) ({
    ^bb0(%arg104: memref<f16>, %arg105: memref<f16>, %arg106: memref<f16>):
      "lmhlo.add"(%arg104, %arg105, %arg106) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<[3, 2]> : tensor<2xi64>} : (memref<4x512x7x7xf16>, memref<f16>, memref<4x512xf16>) -> ()
    %61 = call @Unknown61(%alloc_24) : (memref<4x512xf16>) -> memref<4x512xf16>
    %alloc_25 = memref.alloc() : memref<4x1000xf16>
    "lmhlo.dot"(%61, %23, %alloc_25) {dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [1]>, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x512xf16>, memref<1000x512xf16>, memref<4x1000xf16>) -> ()
    %62 = call @Unknown62(%24, %alloc_25) : (memref<1000xf16>, memref<4x1000xf16>) -> memref<4x1000xf16>
    %alloc_26 = memref.alloc() : memref<4xf16>
    "lmhlo.reduce"(%62, %alloc_1, %alloc_26) ({
    ^bb0(%arg104: memref<f16>, %arg105: memref<f16>, %arg106: memref<f16>):
      "lmhlo.maximum"(%arg104, %arg105, %arg106) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<1> : tensor<1xi64>} : (memref<4x1000xf16>, memref<f16>, memref<4xf16>) -> ()
    %63:2 = call @Unknown63(%alloc_26, %62) : (memref<4xf16>, memref<4x1000xf16>) -> (memref<4x1000xf16>, memref<4x1000xf16>)
    %alloc_27 = memref.alloc() : memref<4xf16>
    "lmhlo.reduce"(%63#1, %alloc_0, %alloc_27) ({
    ^bb0(%arg104: memref<f16>, %arg105: memref<f16>, %arg106: memref<f16>):
      "lmhlo.add"(%arg104, %arg105, %arg106) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<1> : tensor<1xi64>} : (memref<4x1000xf16>, memref<f16>, memref<4xf16>) -> ()
    %64 = call @Unknown64(%alloc_27) : (memref<4xf16>) -> memref<4xf16>
    %65:3 = call @Unknown65(%64, %63#0, %alloc_3, %22, %arg1) : (memref<4xf16>, memref<4x1000xf16>, memref<4xf16>, memref<4x1000xf16>, memref<4x1000xf32>) -> (memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf32>)
    %alloc_28 = memref.alloc() : memref<4x512xf16>
    "lmhlo.dot"(%65#0, %23, %alloc_28) {dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [0]>, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<4x1000xf16>, memref<1000x512xf16>, memref<4x512xf16>) -> ()
    %66 = call @Unknown66(%alloc_28, %60#1) : (memref<4x512xf16>, memref<4x512x7x7xi1>) -> memref<4x512x7x7xf16>
    %67:3 = call @BatchNormGradOp67(%alloc_23, %arg98, %66) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %68 = call @ConvBackwardDataOp68(%67#0, %21) : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16>
    %69 = call @ConvBackwardFilterOp69(%58#0, %67#0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16>
    %70 = call @Unknown70(%58#1, %68) : (memref<4x512x7x7xi1>, memref<4x512x7x7xf16>) -> memref<4x512x7x7xf16>
    %71:3 = call @BatchNormGradOp71(%alloc_22, %arg93, %70) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %72 = call @ConvBackwardDataOp72(%71#0, %20) : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16>
    %73 = call @ConvBackwardFilterOp73(%56#0, %71#0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16>
    %74 = call @Unknown74(%66, %72, %56#1) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>) -> memref<4x512x7x7xf16>
    %75:3 = call @BatchNormGradOp75(%alloc_21, %arg83, %74) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %76 = call @ConvBackwardDataOp76(%75#0, %19) : (memref<4x512x7x7xf16>, memref<512x512x3x3xf16>) -> memref<4x512x7x7xf16>
    %77 = call @ConvBackwardFilterOp77(%54#0, %75#0) : (memref<4x512x7x7xf16>, memref<4x512x7x7xf16>) -> memref<512x512x3x3xf16>
    %78 = call @Unknown78(%54#1, %76) : (memref<4x512x7x7xi1>, memref<4x512x7x7xf16>) -> memref<4x512x7x7xf16>
    %79:3 = call @BatchNormGradOp79(%alloc_20, %arg78, %78) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %80 = call @ConvBackwardDataOp80(%79#0, %18) : (memref<4x512x7x7xf16>, memref<512x256x3x3xf16>) -> memref<4x256x14x14xf16>
    %81 = call @ConvBackwardFilterOp81(%51#0, %79#0) : (memref<4x256x14x14xf16>, memref<4x512x7x7xf16>) -> memref<512x256x3x3xf16>
    %82:3 = call @BatchNormGradOp82(%alloc_19, %arg88, %74) : (memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>) -> (memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %83 = call @ConvBackwardDataOp83(%82#0, %17) : (memref<4x512x7x7xf16>, memref<512x256x1x1xf16>) -> memref<4x256x14x14xf16>
    %84 = call @ConvBackwardFilterOp84(%51#0, %82#0) : (memref<4x256x14x14xf16>, memref<4x512x7x7xf16>) -> memref<512x256x1x1xf16>
    %85 = call @Unknown85(%83, %80, %51#1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) -> memref<4x256x14x14xf16>
    %86:3 = call @BatchNormGradOp86(%alloc_18, %arg73, %85) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %87 = call @ConvBackwardDataOp87(%86#0, %16) : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16>
    %88 = call @ConvBackwardFilterOp88(%49#0, %86#0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16>
    %89 = call @Unknown89(%49#1, %87) : (memref<4x256x14x14xi1>, memref<4x256x14x14xf16>) -> memref<4x256x14x14xf16>
    %90:3 = call @BatchNormGradOp90(%alloc_17, %arg68, %89) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %91 = call @ConvBackwardDataOp91(%90#0, %15) : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16>
    %92 = call @ConvBackwardFilterOp92(%47#0, %90#0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16>
    %93 = call @Unknown93(%85, %91, %47#1) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>) -> memref<4x256x14x14xf16>
    %94:3 = call @BatchNormGradOp94(%alloc_16, %arg58, %93) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %95 = call @ConvBackwardDataOp95(%94#0, %14) : (memref<4x256x14x14xf16>, memref<256x256x3x3xf16>) -> memref<4x256x14x14xf16>
    %96 = call @ConvBackwardFilterOp96(%45#0, %94#0) : (memref<4x256x14x14xf16>, memref<4x256x14x14xf16>) -> memref<256x256x3x3xf16>
    %97 = call @Unknown97(%45#1, %95) : (memref<4x256x14x14xi1>, memref<4x256x14x14xf16>) -> memref<4x256x14x14xf16>
    %98:3 = call @BatchNormGradOp98(%alloc_15, %arg53, %97) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %99 = call @ConvBackwardDataOp99(%98#0, %13) : (memref<4x256x14x14xf16>, memref<256x128x3x3xf16>) -> memref<4x128x28x28xf16>
    %100 = call @ConvBackwardFilterOp100(%42#0, %98#0) : (memref<4x128x28x28xf16>, memref<4x256x14x14xf16>) -> memref<256x128x3x3xf16>
    %101:3 = call @BatchNormGradOp101(%alloc_14, %arg63, %93) : (memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>) -> (memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %102 = call @ConvBackwardDataOp102(%101#0, %12) : (memref<4x256x14x14xf16>, memref<256x128x1x1xf16>) -> memref<4x128x28x28xf16>
    %103 = call @ConvBackwardFilterOp103(%42#0, %101#0) : (memref<4x128x28x28xf16>, memref<4x256x14x14xf16>) -> memref<256x128x1x1xf16>
    %104 = call @Unknown104(%102, %99, %42#1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) -> memref<4x128x28x28xf16>
    %105:3 = call @BatchNormGradOp105(%alloc_13, %arg48, %104) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %106 = call @ConvBackwardDataOp106(%105#0, %11) : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16>
    %107 = call @ConvBackwardFilterOp107(%40#0, %105#0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16>
    %108 = call @Unknown108(%40#1, %106) : (memref<4x128x28x28xi1>, memref<4x128x28x28xf16>) -> memref<4x128x28x28xf16>
    %109:3 = call @BatchNormGradOp109(%alloc_12, %arg43, %108) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %110 = call @ConvBackwardDataOp110(%109#0, %10) : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16>
    %111 = call @ConvBackwardFilterOp111(%38#0, %109#0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16>
    %112 = call @Unknown112(%104, %110, %38#1) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>) -> memref<4x128x28x28xf16>
    %113:3 = call @BatchNormGradOp113(%alloc_11, %arg33, %112) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %114 = call @ConvBackwardDataOp114(%113#0, %9) : (memref<4x128x28x28xf16>, memref<128x128x3x3xf16>) -> memref<4x128x28x28xf16>
    %115 = call @ConvBackwardFilterOp115(%36#0, %113#0) : (memref<4x128x28x28xf16>, memref<4x128x28x28xf16>) -> memref<128x128x3x3xf16>
    %116 = call @Unknown116(%36#1, %114) : (memref<4x128x28x28xi1>, memref<4x128x28x28xf16>) -> memref<4x128x28x28xf16>
    %117:3 = call @BatchNormGradOp117(%alloc_10, %arg28, %116) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %118 = call @ConvBackwardDataOp118(%117#0, %8) : (memref<4x128x28x28xf16>, memref<128x64x3x3xf16>) -> memref<4x64x56x56xf16>
    %119 = call @ConvBackwardFilterOp119(%33#0, %117#0) : (memref<4x64x56x56xf16>, memref<4x128x28x28xf16>) -> memref<128x64x3x3xf16>
    %120:3 = call @BatchNormGradOp120(%alloc_9, %arg38, %112) : (memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>) -> (memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %121 = call @ConvBackwardDataOp121(%120#0, %7) : (memref<4x128x28x28xf16>, memref<128x64x1x1xf16>) -> memref<4x64x56x56xf16>
    %122 = call @ConvBackwardFilterOp122(%33#0, %120#0) : (memref<4x64x56x56xf16>, memref<4x128x28x28xf16>) -> memref<128x64x1x1xf16>
    %123 = call @Unknown123(%121, %118, %33#1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) -> memref<4x64x56x56xf16>
    %124:3 = call @BatchNormGradOp124(%alloc_8, %arg23, %123) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %125 = call @ConvBackwardDataOp125(%124#0, %6) : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16>
    %126 = call @ConvBackwardFilterOp126(%31#0, %124#0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16>
    %127 = call @Unknown127(%31#1, %125) : (memref<4x64x56x56xi1>, memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16>
    %128:3 = call @BatchNormGradOp128(%alloc_7, %arg18, %127) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %129 = call @ConvBackwardDataOp129(%128#0, %5) : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16>
    %130 = call @ConvBackwardFilterOp130(%29#0, %128#0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16>
    %131 = call @Unknown131(%123, %129, %29#1) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>) -> memref<4x64x56x56xf16>
    %132:3 = call @BatchNormGradOp132(%alloc_6, %arg13, %131) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %133 = call @ConvBackwardDataOp133(%132#0, %4) : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16>
    %134 = call @ConvBackwardFilterOp134(%27#0, %132#0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16>
    %135 = call @Unknown135(%27#1, %133) : (memref<4x64x56x56xi1>, memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16>
    %136:3 = call @BatchNormGradOp136(%alloc_5, %arg8, %135) : (memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>) -> (memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %137 = call @ConvBackwardDataOp137(%136#0, %3) : (memref<4x64x56x56xf16>, memref<64x64x3x3xf16>) -> memref<4x64x56x56xf16>
    %138 = call @ConvBackwardFilterOp138(%alloc_4, %136#0) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> memref<64x64x3x3xf16>
    %139 = call @Unknown139(%131, %137) : (memref<4x64x56x56xf16>, memref<4x64x56x56xf16>) -> memref<4x64x56x56xf16>
    %alloc_29 = memref.alloc() : memref<4x64x112x112xf16>
    "lmhlo.select_and_scatter"(%25#0, %139, %alloc_0, %alloc_29) ({
    ^bb0(%arg104: tensor<f16>, %arg105: tensor<f16>):
      %166 = mhlo.compare  GE, %arg104, %arg105 : (tensor<f16>, tensor<f16>) -> tensor<i1>
      mhlo.return %166 : tensor<i1>
    }, {
    ^bb0(%arg104: tensor<f16>, %arg105: tensor<f16>):
      %166 = mhlo.add %arg104, %arg105 : tensor<f16>
      mhlo.return %166 : tensor<f16>
    }) {padding = dense<[[0, 0], [0, 0], [1, 1], [1, 1]]> : tensor<4x2xi64>, window_dimensions = dense<[1, 1, 3, 3]> : tensor<4xi64>, window_strides = dense<[1, 1, 2, 2]> : tensor<4xi64>} : (memref<4x64x112x112xf16>, memref<4x64x56x56xf16>, memref<f16>, memref<4x64x112x112xf16>) -> ()
    %140 = call @Unknown140(%25#1, %alloc_29) : (memref<4x64x112x112xi1>, memref<4x64x112x112xf16>) -> memref<4x64x112x112xf16>
    %141:3 = call @BatchNormGradOp141(%alloc_2, %arg3, %140) : (memref<4x64x112x112xf16>, memref<64xf32>, memref<4x64x112x112xf16>) -> (memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>)
    %142 = call @ConvBackwardFilterOp142(%0, %141#0) : (memref<4x3x224x224xf16>, memref<4x64x112x112xf16>) -> memref<64x3x7x7xf16>
    %alloc_30 = memref.alloc() : memref<f32>
    "lmhlo.reduce"(%65#1, %alloc, %alloc_30) ({
    ^bb0(%arg104: memref<f32>, %arg105: memref<f32>, %arg106: memref<f32>):
      "lmhlo.add"(%arg104, %arg105, %arg106) : (memref<f32>, memref<f32>, memref<f32>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<[0, 1]> : tensor<2xi64>} : (memref<4x1000xf32>, memref<f32>, memref<f32>) -> ()
    %143 = call @Unknown143(%alloc_30) : (memref<f32>) -> memref<f32>
    %144 = call @Unknown144(%142) : (memref<64x3x7x7xf16>) -> memref<64x3x7x7xf32>
    %145 = call @Unknown145(%138) : (memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32>
    %146 = call @Unknown146(%134) : (memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32>
    %147 = call @Unknown147(%130) : (memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32>
    %148 = call @Unknown148(%126) : (memref<64x64x3x3xf16>) -> memref<64x64x3x3xf32>
    %149 = call @Unknown149(%119) : (memref<128x64x3x3xf16>) -> memref<128x64x3x3xf32>
    %150 = call @Unknown150(%115) : (memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32>
    %151 = call @Unknown151(%122) : (memref<128x64x1x1xf16>) -> memref<128x64x1x1xf32>
    %152 = call @Unknown152(%111) : (memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32>
    %153 = call @Unknown153(%107) : (memref<128x128x3x3xf16>) -> memref<128x128x3x3xf32>
    %154 = call @Unknown154(%100) : (memref<256x128x3x3xf16>) -> memref<256x128x3x3xf32>
    %155 = call @Unknown155(%96) : (memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32>
    %156 = call @Unknown156(%103) : (memref<256x128x1x1xf16>) -> memref<256x128x1x1xf32>
    %157 = call @Unknown157(%92) : (memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32>
    %158 = call @Unknown158(%88) : (memref<256x256x3x3xf16>) -> memref<256x256x3x3xf32>
    %159 = call @Unknown159(%81) : (memref<512x256x3x3xf16>) -> memref<512x256x3x3xf32>
    %160 = call @Unknown160(%77) : (memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32>
    %161 = call @Unknown161(%84) : (memref<512x256x1x1xf16>) -> memref<512x256x1x1xf32>
    %162 = call @Unknown162(%73) : (memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32>
    %163 = call @Unknown163(%69) : (memref<512x512x3x3xf16>) -> memref<512x512x3x3xf32>
    %164 = call @MatmulOp164(%61, %65#0) : (memref<4x512xf16>, memref<4x1000xf16>) -> memref<1000x512xf16>
    %165 = call @Unknown165(%164) : (memref<1000x512xf16>) -> memref<1000x512xf32>
    %alloc_31 = memref.alloc() : memref<1000xf32>
    "lmhlo.reduce"(%65#2, %alloc, %alloc_31) ({
    ^bb0(%arg104: memref<f32>, %arg105: memref<f32>, %arg106: memref<f32>):
      "lmhlo.add"(%arg104, %arg105, %arg106) : (memref<f32>, memref<f32>, memref<f32>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<0> : tensor<1xi64>} : (memref<4x1000xf32>, memref<f32>, memref<1000xf32>) -> ()
    return %143, %144, %141#1, %141#2, %145, %136#1, %136#2, %146, %132#1, %132#2, %147, %128#1, %128#2, %148, %124#1, %124#2, %149, %117#1, %117#2, %150, %113#1, %113#2, %151, %120#1, %120#2, %152, %109#1, %109#2, %153, %105#1, %105#2, %154, %98#1, %98#2, %155, %94#1, %94#2, %156, %101#1, %101#2, %157, %90#1, %90#2, %158, %86#1, %86#2, %159, %79#1, %79#2, %160, %75#1, %75#2, %161, %82#1, %82#2, %162, %71#1, %71#2, %163, %67#1, %67#2, %165, %alloc_31 : memref<f32>, memref<64x3x7x7xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<64x64x3x3xf32>, memref<64xf32>, memref<64xf32>, memref<128x64x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x64x1x1xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<128x128x3x3xf32>, memref<128xf32>, memref<128xf32>, memref<256x128x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x128x1x1xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<256x256x3x3xf32>, memref<256xf32>, memref<256xf32>, memref<512x256x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x256x1x1xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<512x512x3x3xf32>, memref<512xf32>, memref<512xf32>, memref<1000x512xf32>, memref<1000xf32>
  }
}