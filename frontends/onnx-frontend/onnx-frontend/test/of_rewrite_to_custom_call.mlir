// RUN: onnx-frontend-opt -rewrite-to-custom-call="ops=arg_max,arg_min,layer_norm,erf,gelu,l2_norm,quantize,dequantize,softmax,instance_norm,resize" -of-canonicalize -constprop-onnx -of-canonicalize %s -split-input-file | FileCheck %s

func.func @test_arg_max(%arg0: tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64> {
  %0 = "onnx.ArgMax"(%arg0) {axis = 3 : si64, keepdims = 0 : si64, onnx_node_name = "ArgMax_0"} : (tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64>
  return %0 : tensor<1x5x5xi64>
// CHECK-LABEL:  @test_arg_max
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.arg_max(%arg0) {backend_config = "", byteir_attrs = {axis = 3 : i64, keep_dims = false, select_last_index = false}} : (tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64>
// CHECK-NEXT:   return [[VAR_0_]] : tensor<1x5x5xi64>
}

// -----

func.func @test_arg_min(%arg0: tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64> {
  %0 = "onnx.ArgMin"(%arg0) {axis = 3 : si64, keepdims = 0 : si64, onnx_node_name = "ArgMax_0"} : (tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64>
  return %0 : tensor<1x5x5xi64>
// CHECK-LABEL:  @test_arg_min
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.arg_min(%arg0) {backend_config = "", byteir_attrs = {axis = 3 : i64, keep_dims = false, select_last_index = false}} : (tensor<1x5x5x3xf32>) -> tensor<1x5x5xi64>
// CHECK-NEXT:   return [[VAR_0_]] : tensor<1x5x5xi64>
}

// -----

func.func @test_layer_norm(%arg0: tensor<2x4x3xf32>) -> tensor<2x4x3xf32> {
  %22 = "onnx.ReduceMeanV13"(%arg0) {axes = [-1], onnx_node_name = "ReduceMean_25"} : (tensor<2x4x3xf32>) -> tensor<2x4x1xf32>
  %23 = "onnx.Sub"(%arg0, %22) {onnx_node_name = "Sub_26"} : (tensor<2x4x3xf32>, tensor<2x4x1xf32>) -> tensor<2x4x3xf32>
  %24 = "onnx.Constant"() {value = dense<2.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %25 = "onnx.Pow"(%23, %24) {onnx_node_name = "Pow_28"} : (tensor<2x4x3xf32>, tensor<f32>) -> tensor<2x4x3xf32>
  %26 = "onnx.ReduceMeanV13"(%25) {axes = [-1], onnx_node_name = "ReduceMean_29"} : (tensor<2x4x3xf32>) -> tensor<2x4x1xf32>
  %27 = "onnx.Constant"() {value = dense<9.99999974E-6> : tensor<f32>} : () -> tensor<f32>
  %28 = "onnx.Add"(%26, %27) {onnx_node_name = "Add_31"} : (tensor<2x4x1xf32>, tensor<f32>) -> tensor<2x4x1xf32>
  %29 = "onnx.Sqrt"(%28) {onnx_node_name = "Sqrt_32"} : (tensor<2x4x1xf32>) -> tensor<2x4x1xf32>
  %30 = "onnx.Div"(%23, %29) {onnx_node_name = "Div_33"} : (tensor<2x4x3xf32>, tensor<2x4x1xf32>) -> tensor<2x4x3xf32>
  %31 = "onnx.Constant"() {value = dense<[0.15, 0.2, 0.25]> : tensor<3xf32>} : () -> tensor<3xf32>
  %32 = "onnx.Mul"(%30, %31) {onnx_node_name = "Mul_34"} : (tensor<2x4x3xf32>, tensor<3xf32>) -> tensor<2x4x3xf32>
  %33 = "onnx.Constant"() {value = dense<[1.0, 2.0, 3.0]> : tensor<3xf32>} : () -> tensor<3xf32>
  %34 = "onnx.Add"(%32, %33) {onnx_node_name = "Add_35"} : (tensor<2x4x3xf32>, tensor<3xf32>) -> tensor<2x4x3xf32>
  return %34 : tensor<2x4x3xf32>
// CHECK-LABEL:  @test_layer_norm(%arg0: tensor<2x4x3xf32>) -> tensor<2x4x3xf32> {
// CHECK-DAG:    [[VAR_0_:%.+]] = onnx.Constant dense<[1.500000e-01, 2.000000e-01, 2.500000e-01]> : tensor<3xf32>
// CHECK-DAG:    [[VAR_1_:%.+]] = onnx.Constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>
// CHECK-NEXT:   %2 = mhlo.custom_call @byteir.layer_norm(%arg0, [[VAR_0_]], [[VAR_1_]]) {backend_config = "", byteir_attrs = {axis = [2], epsilon = 9.9999997473787516E-6 : f64}} : (tensor<2x4x3xf32>, tensor<3xf32>, tensor<3xf32>) -> tensor<2x4x3xf32>
// CHECK-NEXT:   return %2 : tensor<2x4x3xf32>
}

// -----

func.func @test_layer_norm_without_last_add(%arg0: tensor<1x3xf32>) -> tensor<1x3xf32> {
  %550 = "onnx.Constant"() {value = dense<2.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %551 = "onnx.Constant"() {value = dense<9.99999974E-6> : tensor<f32>} : () -> tensor<f32>
  %526 = "onnx.Constant"() {value = dense<[0.15, 0.2, 0.25]> : tensor<3xf32>} : () -> tensor<3xf32>
  %963 = "onnx.ReduceMeanV13"(%arg0) {axes = [-1], keepdims = 1 : si64, onnx_node_name = "ReduceMean_536"} : (tensor<1x3xf32>) -> tensor<1x1xf32>
  %964 = "onnx.Sub"(%arg0, %963) {onnx_node_name = "Sub_537"} : (tensor<1x3xf32>, tensor<1x1xf32>) -> tensor<1x3xf32>
  %965 = "onnx.Pow"(%964, %550) {onnx_node_name = "Pow_539"} : (tensor<1x3xf32>, tensor<f32>) -> tensor<1x3xf32>
  %966 = "onnx.ReduceMeanV13"(%965) {axes = [-1], keepdims = 1 : si64, onnx_node_name = "ReduceMean_540"} : (tensor<1x3xf32>) -> tensor<1x1xf32>
  %967 = "onnx.Add"(%966, %551) {onnx_node_name = "Add_542"} : (tensor<1x1xf32>, tensor<f32>) -> tensor<1x1xf32>
  %968 = "onnx.Sqrt"(%967) {onnx_node_name = "Sqrt_543"} : (tensor<1x1xf32>) -> tensor<1x1xf32>
  %969 = "onnx.Div"(%964, %968) {onnx_node_name = "Div_544"} : (tensor<1x3xf32>, tensor<1x1xf32>) -> tensor<1x3xf32>
  %970 = "onnx.Mul"(%969, %526) {onnx_node_name = "Mul_545"} : (tensor<1x3xf32>, tensor<3xf32>) -> tensor<1x3xf32>
  // onnx.Add is folded here
  return %970 : tensor<1x3xf32>
// CHECK-LABEL:  @test_layer_norm_without_last_add(%arg0: tensor<1x3xf32>) -> tensor<1x3xf32> {
// CHECK-DAG:    [[VAR_0_:%.+]] = onnx.Constant dense<[1.500000e-01, 2.000000e-01, 2.500000e-01]> : tensor<3xf32>
// CHECK-DAG:    [[VAR_1_:%.+]] = onnx.Constant dense<0.000000e+00> : tensor<3xf32>
// CHECK-NEXT:   %2 = mhlo.custom_call @byteir.layer_norm(%arg0, [[VAR_0_]], [[VAR_1_]]) {backend_config = "", byteir_attrs = {axis = [1], epsilon = 9.9999997473787516E-6 : f64}} : (tensor<1x3xf32>, tensor<3xf32>, tensor<3xf32>) -> tensor<1x3xf32>
// CHECK-NEXT:   return %2 : tensor<1x3xf32>
}

// -----

func.func @test_erf(%arg0: tensor<3x2xf32>) -> tensor<3x2xf32> {
  %0 = "onnx.Erf"(%arg0) : (tensor<3x2xf32>) -> tensor<3x2xf32>
  return %0 : tensor<3x2xf32>
// CHECK-LABEL:  @test_erf
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<3x2xf32>) -> tensor<3x2xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.erf(%arg0) {backend_config = ""} : (tensor<3x2xf32>) -> tensor<3x2xf32>
// CHECK-NEXT:   return [[VAR_0_]] : tensor<3x2xf32>
}

// -----

func.func @test_gelu(%37: tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32> {
  %38 = "onnx.Constant"() {value = dense<0.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %39 = "onnx.Add"(%37, %38) : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %40 = "onnx.Constant"() {value = dense<1.41421354> : tensor<f32>} : () -> tensor<f32>
  %41 = "onnx.Div"(%39, %40) {onnx_node_name = "Div_32"} : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %42 = "onnx.Erf"(%41) {onnx_node_name = "Erf_33"} : (tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
  %43 = "onnx.Constant"() {value = dense<1.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %44 = "onnx.Add"(%42, %43) {onnx_node_name = "Add_35"} : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %45 = "onnx.Mul"(%39, %44) {onnx_node_name = "Mul_36"} : (tensor<1x3x5x5xf32>, tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
  %46 = "onnx.Constant"() {value = dense<5.000000e-01> : tensor<f32>} : () -> tensor<f32>
  %47 = "onnx.Mul"(%45, %46) {onnx_node_name = "Mul_38"} : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  return %47 : tensor<1x3x5x5xf32>
// CHECK-LABEL:  @test_gelu
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.gelu([[PARAM_0_]]) {backend_config = "", byteir_attrs = {approximate = "erf"}} : (tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
// CHECK-NEXT:   return [[VAR_0_]] : tensor<1x3x5x5xf32>
}

// -----

func.func @test_gelu_without_last_mul(%arg0: tensor<1x3x5x5xf32>, %arg1: tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32> {
  %38 = "onnx.Constant"() {value = dense<0.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %39 = "onnx.Add"(%arg0, %38) : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %40 = "onnx.Constant"() {value = dense<1.41421354> : tensor<f32>} : () -> tensor<f32>
  %41 = "onnx.Div"(%39, %40) {onnx_node_name = "Div_32"} : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %42 = "onnx.Erf"(%41) {onnx_node_name = "Erf_33"} : (tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
  %43 = "onnx.Constant"() {value = dense<1.000000e+00> : tensor<f32>} : () -> tensor<f32>
  %44 = "onnx.Add"(%42, %43) {onnx_node_name = "Add_35"} : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  %45 = "onnx.Mul"(%39, %44) {onnx_node_name = "Mul_36"} : (tensor<1x3x5x5xf32>, tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
  // The two ONNXMulOp below has been reordered
  %46 = "onnx.Mul"(%arg1, %45) : (tensor<1x3x5x5xf32>, tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
  %47 = "onnx.Constant"() {value = dense<5.000000e-01> : tensor<f32>} : () -> tensor<f32>
  %48 = "onnx.Mul"(%46, %47) : (tensor<1x3x5x5xf32>, tensor<f32>) -> tensor<1x3x5x5xf32>
  return %48 : tensor<1x3x5x5xf32>
// CHECK-LABEL:  @test_gelu_without_last_mul
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x3x5x5xf32>, [[PARAM_1_:%.+]]: tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.gelu([[PARAM_0_]]) {backend_config = "", byteir_attrs = {approximate = "erf"}} : (tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
// CHECK-NEXT:   [[VAR_1_:%.+]] = "onnx.Mul"([[PARAM_1_]], [[VAR_0_]]) : (tensor<1x3x5x5xf32>, tensor<1x3x5x5xf32>) -> tensor<1x3x5x5xf32>
// CHECK-NEXT:   return [[VAR_1_]] : tensor<1x3x5x5xf32>
}

// -----

func.func @test_l2_norm(%267: tensor<16x128xf32>) -> tensor<16x128xf32> {
  %5 = "onnx.Constant"() {value = dense<9.99999996E-13> : tensor<f32>} : () -> tensor<f32>
  %126 = "onnx.Constant"() {value = dense<[16, 128]> : tensor<2xi64>} : () -> tensor<2xi64>
  %268 = "onnx.ReduceL2V13"(%267) {axes = [-1], keepdims = 1 : si64, onnx_node_name = "ReduceL2_213"} : (tensor<16x128xf32>) -> tensor<16x1xf32>
  %269 = "onnx.Add"(%268, %5) {onnx_node_name = "Add_215"} : (tensor<16x1xf32>, tensor<f32>) -> tensor<16x1xf32>
  %270 = "onnx.Expand"(%269, %126) {onnx_node_name = "Expand_217"} : (tensor<16x1xf32>, tensor<2xi64>) -> tensor<16x128xf32>
  %271 = "onnx.Div"(%267, %270) {onnx_node_name = "Div_218"} : (tensor<16x128xf32>, tensor<16x128xf32>) -> tensor<16x128xf32>
  return %271 : tensor<16x128xf32>
// CHECK-LABEL:  @test_l2_norm
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<16x128xf32>) -> tensor<16x128xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.l2_norm(%arg0) {backend_config = "", byteir_attrs = {axis = [1], epsilon = 9.999999960041972E-13 : f64}} : (tensor<16x128xf32>) -> tensor<16x128xf32>
// CHECK-NEXT:   return [[VAR_0_]] : tensor<16x128xf32>
}

// -----

func.func @test_quantize_per_tensor(%arg0: tensor<16x3x256x256xf32>) -> tensor<16x3x256x256xi8> {
  %291 = mhlo.constant dense<0.0207054354> : tensor<f32>
  %292 = mhlo.constant dense<0> : tensor<i8>
  %293 = "onnx.QuantizeLinear"(%arg0, %291, %292) {onnx_node_name = "QuantizeLinear_2"} : (tensor<16x3x256x256xf32>, tensor<f32>, tensor<i8>) -> tensor<16x3x256x256xi8>
  return %293 : tensor<16x3x256x256xi8>
// CHECK-LABEL:  @test_quantize_per_tensor
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<16x3x256x256xf32>) -> tensor<16x3x256x256xi8> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.constant dense<0.0207054354> : tensor<f32>
// CHECK-NEXT:   [[VAR_1_:%.+]] = mhlo.constant dense<0> : tensor<i8>
// CHECK-NEXT:   [[VAR_2_:%.+]] = mhlo.custom_call @byteir.quantize(%arg0, %0, %1) {backend_config = "", byteir_attrs = {}} : (tensor<16x3x256x256xf32>, tensor<f32>, tensor<i8>) -> tensor<16x3x256x256xi8>
// CHECK-NEXT:   return [[VAR_2_]] : tensor<16x3x256x256xi8>
}

func.func @test_dequantize_per_channel_on_weights(%295: tensor<4x3x7x7xi8>) -> tensor<4x3x7x7xf32> {
  %288 = mhlo.constant dense<[6.71244226E-4, 8.52292985E-4, 9.84143698E-4, 6.72663445E-4]> : tensor<4xf32>
  %289 = mhlo.constant dense<0> : tensor<4xi8>
  %296 = "onnx.DequantizeLinear"(%295, %288, %289) {axis = 0 : si64, onnx_node_name = "DequantizeLinear_8"} : (tensor<4x3x7x7xi8>, tensor<4xf32>, tensor<4xi8>) -> tensor<4x3x7x7xf32>
  return %296 : tensor<4x3x7x7xf32>
// CHECK-LABEL:  func.func @test_dequantize_per_channel_on_weights
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<4x3x7x7xi8>) -> tensor<4x3x7x7xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.constant dense<[6.71244226E-4, 8.52292985E-4, 9.84143698E-4, 6.72663445E-4]> : tensor<4xf32>
// CHECK-NEXT:   [[VAR_1_:%.+]] = mhlo.constant dense<0> : tensor<4xi8>
// CHECK-NEXT:   [[VAR_2_:%.+]] = mhlo.custom_call @byteir.dequantize(%arg0, %0, %1) {backend_config = "", byteir_attrs = {axis = 0 : i64}} : (tensor<4x3x7x7xi8>, tensor<4xf32>, tensor<4xi8>) -> tensor<4x3x7x7xf32>
// CHECK-NEXT:   return [[VAR_2_]] : tensor<4x3x7x7xf32>
}

func.func @test_softmax(%9: tensor<1x10xf32>) -> tensor<1x10xf32> {
  %10 = "onnx.Softmax"(%9) {axis = 1 : si64} : (tensor<1x10xf32>) -> tensor<1x10xf32>
  return %10 : tensor<1x10xf32>
// CHECK-LABEL:  func.func @test_softmax
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x10xf32>) -> tensor<1x10xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.custom_call @byteir.softmax(%arg0) {backend_config = "", byteir_attrs = {axis = 1 : i64}} : (tensor<1x10xf32>) -> tensor<1x10xf32>
}

func.func @test_instance_norm(%116: tensor<1x32x3xf32>, %67: tensor<32xf32>, %68: tensor<32xf32>) -> tensor<1x32x3xf32> {
  %117 = "onnx.InstanceNormalization"(%116, %67, %68) {epsilon = 9.99999997E-7 : f32, onnx_node_name = "InstanceNormalization_5"} : (tensor<1x32x3xf32>, tensor<32xf32>, tensor<32xf32>) -> tensor<1x32x3xf32>
  return %117 : tensor<1x32x3xf32>
// CHECK-LABEL:  func.func @test_instance_norm
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x32x3xf32>, [[PARAM_1_:%.+]]: tensor<32xf32>, [[PARAM_2_:%.+]]: tensor<32xf32>) -> tensor<1x32x3xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = mhlo.constant dense<1.000000e+00> : tensor<3xf32>
// CHECK-NEXT:   [[VAR_1_:%.+]] = mhlo.constant dense<0.000000e+00> : tensor<3xf32>
// CHECK-NEXT:   [[VAR_2_:%.+]] = mhlo.custom_call @byteir.layer_norm([[PARAM_0_]], [[VAR_0_]], [[VAR_1_]]) {backend_config = "", byteir_attrs = {axis = [2], epsilon = 9.9999999747524271E-7 : f64}} : (tensor<1x32x3xf32>, tensor<3xf32>, tensor<3xf32>) -> tensor<1x32x3xf32>
// CHECK-NEXT:   [[VAR_3_:%.+]] = mhlo.reshape [[PARAM_1_]] : (tensor<32xf32>) -> tensor<1x32x1xf32>
// CHECK-NEXT:   [[VAR_4_:%.+]] = mhlo.reshape [[PARAM_2_]] : (tensor<32xf32>) -> tensor<1x32x1xf32>
// CHECK-NEXT:   [[VAR_5_:%.+]] = "onnx.Mul"([[VAR_2_]], [[VAR_3_]]) : (tensor<1x32x3xf32>, tensor<1x32x1xf32>) -> tensor<1x32x3xf32>
// CHECK-NEXT:   [[VAR_6_:%.+]] = "onnx.Add"([[VAR_5_]], [[VAR_4_]]) : (tensor<1x32x3xf32>, tensor<1x32x1xf32>) -> tensor<1x32x3xf32>
}

func.func @test_resize_nearest_by_scale(%268: tensor<1x3x4x4xf32>) -> tensor<1x3x8x8xf32> {
  %108 = onnx.Constant dense<[1.000000e+00, 1.000000e+00, 2.000000e+00, 2.000000e+00]> : tensor<4xf32>
  %269 = "onnx.NoValue"() {value} : () -> none
  %270 = "onnx.NoValue"() {value} : () -> none
  %271 = "onnx.Resize"(%268, %269, %108, %270) {coordinate_transformation_mode = "asymmetric", cubic_coeff_a = -7.500000e-01 : f32, exclude_outside = 0 : si64, extrapolation_value = 0.000000e+00 : f32, mode = "nearest", nearest_mode = "floor", onnx_node_name = "Resize_236"} : (tensor<1x3x4x4xf32>, none, tensor<4xf32>, none) -> tensor<1x3x8x8xf32>
  return %271 : tensor<1x3x8x8xf32>
// CHECK-LABEL:  func.func @test_resize
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x3x4x4xf32>) -> tensor<1x3x8x8xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = onnx.Constant dense<[1.000000e+00, 1.000000e+00, 2.000000e+00, 2.000000e+00]> : tensor<4xf32>
// CHECK-NEXT:   [[VAR_1_:%.+]] = mhlo.custom_call @byteir.resize([[PARAM_0_]], [[VAR_0_]]) {backend_config = "", byteir_attrs = {coordinate_transformation_mode = "asymmetric", mode = "nearest", target_mode = "scale"}} : (tensor<1x3x4x4xf32>, tensor<4xf32>) -> tensor<1x3x8x8xf32>
}

func.func @test_resize_linear_by_size(%214: tensor<1x1x15x20xf32>) -> tensor<1x1x30x40xf32> {
  %219 = onnx.Constant dense<[1, 1, 30, 40]> : tensor<4xi64>
  %220 = onnx.Constant dense<> : tensor<0xf32>
  %221 = onnx.Constant dense<> : tensor<0xf32>
  %222 = "onnx.Resize"(%214, %220, %221, %219) {coordinate_transformation_mode = "pytorch_half_pixel", cubic_coeff_a = -7.500000e-01 : f32, exclude_outside = 0 : si64, extrapolation_value = 0.000000e+00 : f32, mode = "linear", nearest_mode = "floor", onnx_node_name = "Resize_147"} : (tensor<1x1x15x20xf32>, tensor<0xf32>, tensor<0xf32>, tensor<4xi64>) -> tensor<1x1x30x40xf32>
  return %222 : tensor<1x1x30x40xf32>
// CHECK-LABEL:  func.func @test_resize_linear_by_size
// CHECK-SAME:   ([[PARAM_0_:%.+]]: tensor<1x1x15x20xf32>) -> tensor<1x1x30x40xf32> {
// CHECK-NEXT:   [[VAR_0_:%.+]] = onnx.Constant dense<[1, 1, 30, 40]> : tensor<4xi64>
// CHECK-NEXT:   [[VAR_1_:%.+]] = mhlo.custom_call @byteir.resize(%arg0, %0) {backend_config = "", byteir_attrs = {coordinate_transformation_mode = "pytorch_half_pixel", mode = "linear", target_mode = "size"}} : (tensor<1x1x15x20xf32>, tensor<4xi64>) -> tensor<1x1x30x40xf32>
}
