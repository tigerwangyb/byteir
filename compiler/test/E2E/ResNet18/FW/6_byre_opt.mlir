// RUN: byteir-opt %s -byre-opt="append-arg-types" | FileCheck %s

// CHECK-LABEL: func.func @main

module attributes {gpu.container_module} {
  gpu.module @unified {
    gpu.func @Unknown100(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown99(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown98(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown97(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown96(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown95(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown94(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown93(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown92(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown91(%arg0: memref<512xf32>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<512xf32>
        %7 = memref.load %arg1[%4] : memref<512xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown90(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown89(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown88(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown87(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown86(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown85(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown84(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown83(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown82(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown81(%arg0: memref<256xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c256 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<256xf32>
        %7 = memref.load %arg1[%4] : memref<256xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<256xf32>
      }
      gpu.return
    }
    gpu.func @Unknown80(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown79(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown78(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown77(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown76(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown75(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown74(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown73(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown72(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown71(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c128 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<128xf32>
        %7 = memref.load %arg1[%4] : memref<128xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<128xf32>
      }
      gpu.return
    }
    gpu.func @Unknown70(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown69(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown68(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown67(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown66(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown65(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown64(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown63(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown62(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown61(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) kernel {
      %cst = arith.constant 1.000000e-01 : f32
      %cst_0 = arith.constant 0.899999976 : f32
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c64 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<64xf32>
        %7 = memref.load %arg1[%4] : memref<64xf32>
        %8 = arith.mulf %7, %cst_0 : f32
        %9 = arith.mulf %6, %cst : f32
        %10 = arith.addf %9, %8 : f32
        memref.store %10, %arg2[%4] : memref<64xf32>
      }
      gpu.return
    }
    gpu.func @Unknown60(%arg0: memref<1000xf32>, %arg1: memref<1x1000xf16>, %arg2: memref<1x1000xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c1000 = arith.constant 1000 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1000 : index
      scf.if %5 {
        %6 = arith.cmpi slt, %4, %c0 : index
        %7 = arith.addi %4, %c1000 : index
        %8 = arith.select %6, %7, %4 : index
        %9 = memref.load %arg1[%c0, %8] : memref<1x1000xf16>
        %10 = memref.load %arg0[%8] : memref<1000xf32>
        %11 = arith.truncf %10 : f32 to f16
        %12 = arith.addf %9, %11 : f16
        memref.store %12, %arg2[%c0, %8] : memref<1x1000xf16>
      }
      gpu.return
    }
    gpu.func @Unknown59(%arg0: memref<1000x512xf32>, %arg1: memref<1000x512xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c512000 = arith.constant 512000 : index
      %c512 = arith.constant 512 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c512 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c512 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c512 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9] : memref<1000x512xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9] : memref<1000x512xf16>
      }
      gpu.return
    }
    gpu.func @Unknown58(%arg0: memref<1x512xf16>, %arg1: memref<1x512xf16>) kernel {
      %cst = arith.constant 2.040100e-02 : f16
      %c0 = arith.constant 0 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512 : index
      scf.if %5 {
        %6 = arith.cmpi slt, %4, %c0 : index
        %7 = arith.addi %4, %c512 : index
        %8 = arith.select %6, %7, %4 : index
        %9 = memref.load %arg0[%c0, %8] : memref<1x512xf16>
        %10 = arith.mulf %9, %cst : f16
        memref.store %10, %arg1[%c0, %8] : memref<1x512xf16>
      }
      gpu.return
    }
    gpu.func @Unknown57(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>, %arg2: memref<1x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c25088 = arith.constant 25088 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c25088 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown55(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown54(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c25088 = arith.constant 25088 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c25088 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown52(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown51(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>, %arg2: memref<1x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c25088 = arith.constant 25088 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c25088 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown49(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown48(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c25088 = arith.constant 25088 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c25088 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x512x7x7xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown46(%arg0: memref<512x256x3x3xf32>, %arg1: memref<512x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c1179648 = arith.constant 1179648 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1179648 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown44(%arg0: memref<512x256x1x1xf32>, %arg1: memref<512x256x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c131072 = arith.constant 131072 : index
      %c256 = arith.constant 256 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c131072 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c256 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c256 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c256 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<512x256x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<512x256x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown43(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>, %arg2: memref<1x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c50176 = arith.constant 50176 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c50176 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown41(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown40(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c50176 = arith.constant 50176 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c50176 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown38(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown37(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>, %arg2: memref<1x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c50176 = arith.constant 50176 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c50176 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown35(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown34(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c50176 = arith.constant 50176 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c50176 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x256x14x14xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown32(%arg0: memref<256x128x3x3xf32>, %arg1: memref<256x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c294912 = arith.constant 294912 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c294912 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown30(%arg0: memref<256x128x1x1xf32>, %arg1: memref<256x128x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c32768 = arith.constant 32768 : index
      %c128 = arith.constant 128 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c32768 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c128 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c128 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c128 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<256x128x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<256x128x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown29(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>, %arg2: memref<1x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown27(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown26(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown24(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown23(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>, %arg2: memref<1x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown21(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown20(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x128x28x28xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown18(%arg0: memref<128x64x3x3xf32>, %arg1: memref<128x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c73728 = arith.constant 73728 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c73728 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown16(%arg0: memref<128x64x1x1xf32>, %arg1: memref<128x64x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c8192 = arith.constant 8192 : index
      %c64 = arith.constant 64 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c8192 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c64 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c64 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c64 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<128x64x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<128x64x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown15(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>, %arg2: memref<1x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown13(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown12(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown10(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown9(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>, %arg2: memref<1x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<1x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown7(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown6(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x64x56x56xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown4(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown3(%arg0: memref<1x64x112x112xf16>, %arg1: memref<1x64x112x112xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c112 = arith.constant 112 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c112 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c112 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c112 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c112 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c112 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c112 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x64x112x112xf16>
        %37 = arith.maxf %36, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x64x112x112xf16>
      }
      gpu.return
    }
    gpu.func @Unknown1(%arg0: memref<64x3x7x7xf32>, %arg1: memref<64x3x7x7xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c9408 = arith.constant 9408 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c3 = arith.constant 3 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c9408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c3 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c3 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c3 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x3x7x7xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x3x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown0(%arg0: memref<1x3x224x224xf32>, %arg1: memref<1x3x224x224xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c150528 = arith.constant 150528 : index
      %c224 = arith.constant 224 : index
      %c-1 = arith.constant -1 : index
      %c3 = arith.constant 3 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c150528 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c224 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c224 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c224 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c224 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c224 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c224 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c3 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c3 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c3 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<1x3x224x224xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<1x3x224x224xf16>
      }
      gpu.return
    }
  }
  func.func private @Unknown0(%arg0: memref<1x3x224x224xf32>) -> memref<1x3x224x224xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1176 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown0", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1176 = arith.constant 1176 : index
    %alloc = memref.alloc() : memref<1x3x224x224xf16>
    gpu.launch_func  @unified::@Unknown0 blocks in (%c1176, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x3x224x224xf32>, %alloc : memref<1x3x224x224xf16>)
    return %alloc : memref<1x3x224x224xf16>
  }
  func.func private @Unknown1(%arg0: memref<64x3x7x7xf32>) -> memref<64x3x7x7xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 74 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown1", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c74 = arith.constant 74 : index
    %alloc = memref.alloc() : memref<64x3x7x7xf16>
    gpu.launch_func  @unified::@Unknown1 blocks in (%c74, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64x3x7x7xf32>, %alloc : memref<64x3x7x7xf16>)
    return %alloc : memref<64x3x7x7xf16>
  }
  func.func private @BatchNormTrainingOp2(%arg0: memref<1x64x112x112xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> (memref<1x64x112x112xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x64x112x112xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x64x112x112xf16>, memref<1x64x112x112xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x64x112x112xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x64x112x112xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x112x112xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x64x112x112xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x64x112x112xf32>, memref<1x64x112x112xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x64x112x112xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @Unknown3(%arg0: memref<1x64x112x112xf16>) -> memref<1x64x112x112xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 6272 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown3", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c6272 = arith.constant 6272 : index
    %alloc = memref.alloc() : memref<1x64x112x112xf16>
    gpu.launch_func  @unified::@Unknown3 blocks in (%c6272, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x64x112x112xf16>, %alloc : memref<1x64x112x112xf16>)
    return %alloc : memref<1x64x112x112xf16>
  }
  func.func private @Unknown4(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 288 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown4", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c288 = arith.constant 288 : index
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    gpu.launch_func  @unified::@Unknown4 blocks in (%c288, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64x64x3x3xf32>, %alloc : memref<64x64x3x3xf16>)
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @BatchNormTrainingOp5(%arg0: memref<1x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x64x56x56xf32>, memref<1x64x56x56xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @Unknown6(%arg0: memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1568 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown6", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1568 = arith.constant 1568 : index
    %alloc = memref.alloc() : memref<1x64x56x56xf16>
    gpu.launch_func  @unified::@Unknown6 blocks in (%c1568, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x64x56x56xf16>, %alloc : memref<1x64x56x56xf16>)
    return %alloc : memref<1x64x56x56xf16>
  }
  func.func private @Unknown7(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 288 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown7", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c288 = arith.constant 288 : index
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    gpu.launch_func  @unified::@Unknown7 blocks in (%c288, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64x64x3x3xf32>, %alloc : memref<64x64x3x3xf16>)
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @BatchNormTrainingOp8(%arg0: memref<1x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x64x56x56xf32>, memref<1x64x56x56xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @Unknown9(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1568 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown9", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1568 = arith.constant 1568 : index
    %alloc = memref.alloc() : memref<1x64x56x56xf16>
    gpu.launch_func  @unified::@Unknown9 blocks in (%c1568, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x64x56x56xf16>, %arg1 : memref<1x64x56x56xf16>, %alloc : memref<1x64x56x56xf16>)
    return %alloc : memref<1x64x56x56xf16>
  }
  func.func private @Unknown10(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 288 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown10", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c288 = arith.constant 288 : index
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    gpu.launch_func  @unified::@Unknown10 blocks in (%c288, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64x64x3x3xf32>, %alloc : memref<64x64x3x3xf16>)
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @BatchNormTrainingOp11(%arg0: memref<1x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x64x56x56xf32>, memref<1x64x56x56xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @Unknown12(%arg0: memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1568 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown12", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1568 = arith.constant 1568 : index
    %alloc = memref.alloc() : memref<1x64x56x56xf16>
    gpu.launch_func  @unified::@Unknown12 blocks in (%c1568, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x64x56x56xf16>, %alloc : memref<1x64x56x56xf16>)
    return %alloc : memref<1x64x56x56xf16>
  }
  func.func private @Unknown13(%arg0: memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 288 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown13", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c288 = arith.constant 288 : index
    %alloc = memref.alloc() : memref<64x64x3x3xf16>
    gpu.launch_func  @unified::@Unknown13 blocks in (%c288, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64x64x3x3xf32>, %alloc : memref<64x64x3x3xf16>)
    return %alloc : memref<64x64x3x3xf16>
  }
  func.func private @BatchNormTrainingOp14(%arg0: memref<1x64x56x56xf16>, %arg1: memref<64xf32>, %arg2: memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x64x56x56xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x64x56x56xf32>
    %alloc_1 = memref.alloc() : memref<64xf32>
    %alloc_2 = memref.alloc() : memref<64xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>, memref<1x64x56x56xf32>, memref<64xf32>, memref<64xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x64x56x56xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x64x56x56xf32>, memref<1x64x56x56xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>
  }
  func.func private @Unknown15(%arg0: memref<1x64x56x56xf16>, %arg1: memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1568 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown15", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1568 = arith.constant 1568 : index
    %alloc = memref.alloc() : memref<1x64x56x56xf16>
    gpu.launch_func  @unified::@Unknown15 blocks in (%c1568, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x64x56x56xf16>, %arg1 : memref<1x64x56x56xf16>, %alloc : memref<1x64x56x56xf16>)
    return %alloc : memref<1x64x56x56xf16>
  }
  func.func private @Unknown16(%arg0: memref<128x64x1x1xf32>) -> memref<128x64x1x1xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 64 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown16", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    %alloc = memref.alloc() : memref<128x64x1x1xf16>
    gpu.launch_func  @unified::@Unknown16 blocks in (%c64, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128x64x1x1xf32>, %alloc : memref<128x64x1x1xf16>)
    return %alloc : memref<128x64x1x1xf16>
  }
  func.func private @BatchNormTrainingOp17(%arg0: memref<1x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x128x28x28xf32>, memref<1x128x28x28xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @Unknown18(%arg0: memref<128x64x3x3xf32>) -> memref<128x64x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 576 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown18", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c576 = arith.constant 576 : index
    %alloc = memref.alloc() : memref<128x64x3x3xf16>
    gpu.launch_func  @unified::@Unknown18 blocks in (%c576, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128x64x3x3xf32>, %alloc : memref<128x64x3x3xf16>)
    return %alloc : memref<128x64x3x3xf16>
  }
  func.func private @BatchNormTrainingOp19(%arg0: memref<1x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x128x28x28xf32>, memref<1x128x28x28xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @Unknown20(%arg0: memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 784 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown20", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c784 = arith.constant 784 : index
    %alloc = memref.alloc() : memref<1x128x28x28xf16>
    gpu.launch_func  @unified::@Unknown20 blocks in (%c784, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x128x28x28xf16>, %alloc : memref<1x128x28x28xf16>)
    return %alloc : memref<1x128x28x28xf16>
  }
  func.func private @Unknown21(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1152 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown21", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1152 = arith.constant 1152 : index
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    gpu.launch_func  @unified::@Unknown21 blocks in (%c1152, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128x128x3x3xf32>, %alloc : memref<128x128x3x3xf16>)
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @BatchNormTrainingOp22(%arg0: memref<1x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x128x28x28xf32>, memref<1x128x28x28xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @Unknown23(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 784 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown23", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c784 = arith.constant 784 : index
    %alloc = memref.alloc() : memref<1x128x28x28xf16>
    gpu.launch_func  @unified::@Unknown23 blocks in (%c784, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x128x28x28xf16>, %arg1 : memref<1x128x28x28xf16>, %alloc : memref<1x128x28x28xf16>)
    return %alloc : memref<1x128x28x28xf16>
  }
  func.func private @Unknown24(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1152 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown24", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1152 = arith.constant 1152 : index
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    gpu.launch_func  @unified::@Unknown24 blocks in (%c1152, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128x128x3x3xf32>, %alloc : memref<128x128x3x3xf16>)
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @BatchNormTrainingOp25(%arg0: memref<1x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x128x28x28xf32>, memref<1x128x28x28xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @Unknown26(%arg0: memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 784 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown26", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c784 = arith.constant 784 : index
    %alloc = memref.alloc() : memref<1x128x28x28xf16>
    gpu.launch_func  @unified::@Unknown26 blocks in (%c784, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x128x28x28xf16>, %alloc : memref<1x128x28x28xf16>)
    return %alloc : memref<1x128x28x28xf16>
  }
  func.func private @Unknown27(%arg0: memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1152 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown27", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1152 = arith.constant 1152 : index
    %alloc = memref.alloc() : memref<128x128x3x3xf16>
    gpu.launch_func  @unified::@Unknown27 blocks in (%c1152, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128x128x3x3xf32>, %alloc : memref<128x128x3x3xf16>)
    return %alloc : memref<128x128x3x3xf16>
  }
  func.func private @BatchNormTrainingOp28(%arg0: memref<1x128x28x28xf16>, %arg1: memref<128xf32>, %arg2: memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x128x28x28xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x128x28x28xf32>
    %alloc_1 = memref.alloc() : memref<128xf32>
    %alloc_2 = memref.alloc() : memref<128xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<128xf32>, memref<128xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x128x28x28xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x128x28x28xf32>, memref<1x128x28x28xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>
  }
  func.func private @Unknown29(%arg0: memref<1x128x28x28xf16>, %arg1: memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 784 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown29", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c784 = arith.constant 784 : index
    %alloc = memref.alloc() : memref<1x128x28x28xf16>
    gpu.launch_func  @unified::@Unknown29 blocks in (%c784, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x128x28x28xf16>, %arg1 : memref<1x128x28x28xf16>, %alloc : memref<1x128x28x28xf16>)
    return %alloc : memref<1x128x28x28xf16>
  }
  func.func private @Unknown30(%arg0: memref<256x128x1x1xf32>) -> memref<256x128x1x1xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 256 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown30", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c256 = arith.constant 256 : index
    %alloc = memref.alloc() : memref<256x128x1x1xf16>
    gpu.launch_func  @unified::@Unknown30 blocks in (%c256, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256x128x1x1xf32>, %alloc : memref<256x128x1x1xf16>)
    return %alloc : memref<256x128x1x1xf16>
  }
  func.func private @BatchNormTrainingOp31(%arg0: memref<1x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x256x14x14xf32>, memref<1x256x14x14xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @Unknown32(%arg0: memref<256x128x3x3xf32>) -> memref<256x128x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2304 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown32", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2304 = arith.constant 2304 : index
    %alloc = memref.alloc() : memref<256x128x3x3xf16>
    gpu.launch_func  @unified::@Unknown32 blocks in (%c2304, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256x128x3x3xf32>, %alloc : memref<256x128x3x3xf16>)
    return %alloc : memref<256x128x3x3xf16>
  }
  func.func private @BatchNormTrainingOp33(%arg0: memref<1x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x256x14x14xf32>, memref<1x256x14x14xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @Unknown34(%arg0: memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 392 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown34", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c392 = arith.constant 392 : index
    %alloc = memref.alloc() : memref<1x256x14x14xf16>
    gpu.launch_func  @unified::@Unknown34 blocks in (%c392, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x256x14x14xf16>, %alloc : memref<1x256x14x14xf16>)
    return %alloc : memref<1x256x14x14xf16>
  }
  func.func private @Unknown35(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4608 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown35", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4608 = arith.constant 4608 : index
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    gpu.launch_func  @unified::@Unknown35 blocks in (%c4608, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256x256x3x3xf32>, %alloc : memref<256x256x3x3xf16>)
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @BatchNormTrainingOp36(%arg0: memref<1x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x256x14x14xf32>, memref<1x256x14x14xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @Unknown37(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 392 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown37", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c392 = arith.constant 392 : index
    %alloc = memref.alloc() : memref<1x256x14x14xf16>
    gpu.launch_func  @unified::@Unknown37 blocks in (%c392, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x256x14x14xf16>, %arg1 : memref<1x256x14x14xf16>, %alloc : memref<1x256x14x14xf16>)
    return %alloc : memref<1x256x14x14xf16>
  }
  func.func private @Unknown38(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4608 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown38", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4608 = arith.constant 4608 : index
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    gpu.launch_func  @unified::@Unknown38 blocks in (%c4608, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256x256x3x3xf32>, %alloc : memref<256x256x3x3xf16>)
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @BatchNormTrainingOp39(%arg0: memref<1x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x256x14x14xf32>, memref<1x256x14x14xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @Unknown40(%arg0: memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 392 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown40", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c392 = arith.constant 392 : index
    %alloc = memref.alloc() : memref<1x256x14x14xf16>
    gpu.launch_func  @unified::@Unknown40 blocks in (%c392, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x256x14x14xf16>, %alloc : memref<1x256x14x14xf16>)
    return %alloc : memref<1x256x14x14xf16>
  }
  func.func private @Unknown41(%arg0: memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4608 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown41", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4608 = arith.constant 4608 : index
    %alloc = memref.alloc() : memref<256x256x3x3xf16>
    gpu.launch_func  @unified::@Unknown41 blocks in (%c4608, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256x256x3x3xf32>, %alloc : memref<256x256x3x3xf16>)
    return %alloc : memref<256x256x3x3xf16>
  }
  func.func private @BatchNormTrainingOp42(%arg0: memref<1x256x14x14xf16>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x256x14x14xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x256x14x14xf32>
    %alloc_1 = memref.alloc() : memref<256xf32>
    %alloc_2 = memref.alloc() : memref<256xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>, memref<1x256x14x14xf32>, memref<256xf32>, memref<256xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x256x14x14xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x256x14x14xf32>, memref<1x256x14x14xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>
  }
  func.func private @Unknown43(%arg0: memref<1x256x14x14xf16>, %arg1: memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 392 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown43", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c392 = arith.constant 392 : index
    %alloc = memref.alloc() : memref<1x256x14x14xf16>
    gpu.launch_func  @unified::@Unknown43 blocks in (%c392, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x256x14x14xf16>, %arg1 : memref<1x256x14x14xf16>, %alloc : memref<1x256x14x14xf16>)
    return %alloc : memref<1x256x14x14xf16>
  }
  func.func private @Unknown44(%arg0: memref<512x256x1x1xf32>) -> memref<512x256x1x1xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1024 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown44", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c1024 = arith.constant 1024 : index
    %alloc = memref.alloc() : memref<512x256x1x1xf16>
    gpu.launch_func  @unified::@Unknown44 blocks in (%c1024, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512x256x1x1xf32>, %alloc : memref<512x256x1x1xf16>)
    return %alloc : memref<512x256x1x1xf16>
  }
  func.func private @BatchNormTrainingOp45(%arg0: memref<1x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x512x7x7xf32>, memref<1x512x7x7xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @Unknown46(%arg0: memref<512x256x3x3xf32>) -> memref<512x256x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 9216 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown46", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c9216 = arith.constant 9216 : index
    %alloc = memref.alloc() : memref<512x256x3x3xf16>
    gpu.launch_func  @unified::@Unknown46 blocks in (%c9216, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512x256x3x3xf32>, %alloc : memref<512x256x3x3xf16>)
    return %alloc : memref<512x256x3x3xf16>
  }
  func.func private @BatchNormTrainingOp47(%arg0: memref<1x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x512x7x7xf32>, memref<1x512x7x7xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @Unknown48(%arg0: memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 196 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown48", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c196 = arith.constant 196 : index
    %alloc = memref.alloc() : memref<1x512x7x7xf16>
    gpu.launch_func  @unified::@Unknown48 blocks in (%c196, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x512x7x7xf16>, %alloc : memref<1x512x7x7xf16>)
    return %alloc : memref<1x512x7x7xf16>
  }
  func.func private @Unknown49(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 18432 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown49", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c18432 = arith.constant 18432 : index
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    gpu.launch_func  @unified::@Unknown49 blocks in (%c18432, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512x512x3x3xf32>, %alloc : memref<512x512x3x3xf16>)
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @BatchNormTrainingOp50(%arg0: memref<1x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x512x7x7xf32>, memref<1x512x7x7xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @Unknown51(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 196 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown51", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c196 = arith.constant 196 : index
    %alloc = memref.alloc() : memref<1x512x7x7xf16>
    gpu.launch_func  @unified::@Unknown51 blocks in (%c196, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x512x7x7xf16>, %arg1 : memref<1x512x7x7xf16>, %alloc : memref<1x512x7x7xf16>)
    return %alloc : memref<1x512x7x7xf16>
  }
  func.func private @Unknown52(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 18432 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown52", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c18432 = arith.constant 18432 : index
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    gpu.launch_func  @unified::@Unknown52 blocks in (%c18432, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512x512x3x3xf32>, %alloc : memref<512x512x3x3xf16>)
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @BatchNormTrainingOp53(%arg0: memref<1x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x512x7x7xf32>, memref<1x512x7x7xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @Unknown54(%arg0: memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 196 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown54", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c196 = arith.constant 196 : index
    %alloc = memref.alloc() : memref<1x512x7x7xf16>
    gpu.launch_func  @unified::@Unknown54 blocks in (%c196, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x512x7x7xf16>, %alloc : memref<1x512x7x7xf16>)
    return %alloc : memref<1x512x7x7xf16>
  }
  func.func private @Unknown55(%arg0: memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 18432 : i32, __byre__arg_ranks = [4 : i32, 4 : i32], __byre__kernel_name = "Unknown55", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c18432 = arith.constant 18432 : index
    %alloc = memref.alloc() : memref<512x512x3x3xf16>
    gpu.launch_func  @unified::@Unknown55 blocks in (%c18432, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512x512x3x3xf32>, %alloc : memref<512x512x3x3xf16>)
    return %alloc : memref<512x512x3x3xf16>
  }
  func.func private @BatchNormTrainingOp56(%arg0: memref<1x512x7x7xf16>, %arg1: memref<512xf32>, %arg2: memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) attributes {__byre__epsilon = 9.99999974E-6 : f32, __byre__feature_index = 1 : i64, byre_compute_name = "BatchNormTrainingOp"} {
    %alloc = memref.alloc() : memref<1x512x7x7xf32>
    "lmhlo.convert"(%arg0, %alloc) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf32>) -> ()
    %alloc_0 = memref.alloc() : memref<1x512x7x7xf32>
    %alloc_1 = memref.alloc() : memref<512xf32>
    %alloc_2 = memref.alloc() : memref<512xf32>
    "lmhlo.batch_norm_training"(%alloc, %arg1, %arg2, %alloc_0, %alloc_1, %alloc_2) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64} : (memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>, memref<1x512x7x7xf32>, memref<512xf32>, memref<512xf32>) -> ()
    %alloc_3 = memref.alloc() : memref<1x512x7x7xf16>
    "lmhlo.convert"(%alloc_0, %alloc_3) : (memref<1x512x7x7xf32>, memref<1x512x7x7xf16>) -> ()
    return %alloc_3, %alloc_1, %alloc_2 : memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>
  }
  func.func private @Unknown57(%arg0: memref<1x512x7x7xf16>, %arg1: memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 196 : i32, __byre__arg_ranks = [4 : i32, 4 : i32, 4 : i32], __byre__kernel_name = "Unknown57", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c196 = arith.constant 196 : index
    %alloc = memref.alloc() : memref<1x512x7x7xf16>
    gpu.launch_func  @unified::@Unknown57 blocks in (%c196, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x512x7x7xf16>, %arg1 : memref<1x512x7x7xf16>, %alloc : memref<1x512x7x7xf16>)
    return %alloc : memref<1x512x7x7xf16>
  }
  func.func private @Unknown58(%arg0: memref<1x512xf16>) -> memref<1x512xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [2 : i32, 2 : i32], __byre__kernel_name = "Unknown58", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<1x512xf16>
    gpu.launch_func  @unified::@Unknown58 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1x512xf16>, %alloc : memref<1x512xf16>)
    return %alloc : memref<1x512xf16>
  }
  func.func private @Unknown59(%arg0: memref<1000x512xf32>) -> memref<1000x512xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4000 : i32, __byre__arg_ranks = [2 : i32, 2 : i32], __byre__kernel_name = "Unknown59", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4000 = arith.constant 4000 : index
    %alloc = memref.alloc() : memref<1000x512xf16>
    gpu.launch_func  @unified::@Unknown59 blocks in (%c4000, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1000x512xf32>, %alloc : memref<1000x512xf16>)
    return %alloc : memref<1000x512xf16>
  }
  func.func private @Unknown60(%arg0: memref<1000xf32>, %arg1: memref<1x1000xf16>) -> memref<1x1000xf16> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 8 : i32, __byre__arg_ranks = [1 : i32, 2 : i32, 2 : i32], __byre__kernel_name = "Unknown60", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %alloc = memref.alloc() : memref<1x1000xf16>
    gpu.launch_func  @unified::@Unknown60 blocks in (%c8, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<1000xf32>, %arg1 : memref<1x1000xf16>, %alloc : memref<1x1000xf16>)
    return %alloc : memref<1x1000xf16>
  }
  func.func private @Unknown61(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown61", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown61 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown62(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown62", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown62 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown63(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown63", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown63 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown64(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown64", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown64 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown65(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown65", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown65 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown66(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown66", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown66 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown67(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown67", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown67 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown68(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown68", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown68 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown69(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown69", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown69 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown70(%arg0: memref<64xf32>, %arg1: memref<64xf32>) -> memref<64xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown70", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<64xf32>
    gpu.launch_func  @unified::@Unknown70 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<64xf32>, %arg1 : memref<64xf32>, %alloc : memref<64xf32>)
    return %alloc : memref<64xf32>
  }
  func.func private @Unknown71(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown71", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown71 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown72(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown72", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown72 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown73(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown73", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown73 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown74(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown74", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown74 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown75(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown75", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown75 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown76(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown76", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown76 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown77(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown77", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown77 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown78(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown78", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown78 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown79(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown79", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown79 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown80(%arg0: memref<128xf32>, %arg1: memref<128xf32>) -> memref<128xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 1 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown80", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<128xf32>
    gpu.launch_func  @unified::@Unknown80 blocks in (%c1, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<128xf32>, %arg1 : memref<128xf32>, %alloc : memref<128xf32>)
    return %alloc : memref<128xf32>
  }
  func.func private @Unknown81(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown81", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown81 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown82(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown82", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown82 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown83(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown83", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown83 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown84(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown84", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown84 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown85(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown85", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown85 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown86(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown86", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown86 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown87(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown87", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown87 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown88(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown88", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown88 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown89(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown89", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown89 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown90(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 2 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown90", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<256xf32>
    gpu.launch_func  @unified::@Unknown90 blocks in (%c2, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<256xf32>, %arg1 : memref<256xf32>, %alloc : memref<256xf32>)
    return %alloc : memref<256xf32>
  }
  func.func private @Unknown91(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown91", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown91 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown92(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown92", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown92 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown93(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown93", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown93 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown94(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown94", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown94 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown95(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown95", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown95 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown96(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown96", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown96 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown97(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown97", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown97 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown98(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown98", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown98 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown99(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown99", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown99 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func private @Unknown100(%arg0: memref<512xf32>, %arg1: memref<512xf32>) -> memref<512xf32> attributes {__byre__BlockSize.x = 128 : i32, __byre__GridSize.x = 4 : i32, __byre__arg_ranks = [1 : i32, 1 : i32, 1 : i32], __byre__kernel_name = "Unknown100", __byteir_elementwise_fusion__, arg_offsets = [0 : i32, 1 : i32, 2 : i32], byre_compute_name = "PTXOp", byre_force_compute_name} {
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<512xf32>
    gpu.launch_func  @unified::@Unknown100 blocks in (%c4, %c1, %c1) threads in (%c128, %c1, %c1) args(%arg0 : memref<512xf32>, %arg1 : memref<512xf32>, %alloc : memref<512xf32>)
    return %alloc : memref<512xf32>
  }
  func.func @main(%arg0: memref<64xf32>, %arg1: memref<64xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1000xf32>, %arg4: memref<1000x512xf32>, %arg5: memref<64xf32>, %arg6: memref<64xf32>, %arg7: memref<64xf32>, %arg8: memref<64xf32>, %arg9: memref<64x64x3x3xf32>, %arg10: memref<64x64x3x3xf32>, %arg11: memref<64xf32>, %arg12: memref<64xf32>, %arg13: memref<64xf32>, %arg14: memref<64xf32>, %arg15: memref<64x64x3x3xf32>, %arg16: memref<64x64x3x3xf32>, %arg17: memref<128xf32>, %arg18: memref<128xf32>, %arg19: memref<128xf32>, %arg20: memref<128xf32>, %arg21: memref<128x64x3x3xf32>, %arg22: memref<128x128x3x3xf32>, %arg23: memref<128x64x1x1xf32>, %arg24: memref<128xf32>, %arg25: memref<128xf32>, %arg26: memref<128xf32>, %arg27: memref<128xf32>, %arg28: memref<128xf32>, %arg29: memref<128xf32>, %arg30: memref<128x128x3x3xf32>, %arg31: memref<128x128x3x3xf32>, %arg32: memref<256xf32>, %arg33: memref<256xf32>, %arg34: memref<256xf32>, %arg35: memref<256xf32>, %arg36: memref<256x128x3x3xf32>, %arg37: memref<256x256x3x3xf32>, %arg38: memref<256x128x1x1xf32>, %arg39: memref<256xf32>, %arg40: memref<256xf32>, %arg41: memref<256xf32>, %arg42: memref<256xf32>, %arg43: memref<256xf32>, %arg44: memref<256xf32>, %arg45: memref<256x256x3x3xf32>, %arg46: memref<256x256x3x3xf32>, %arg47: memref<512xf32>, %arg48: memref<512xf32>, %arg49: memref<512xf32>, %arg50: memref<512xf32>, %arg51: memref<512x256x3x3xf32>, %arg52: memref<512x512x3x3xf32>, %arg53: memref<512x256x1x1xf32>, %arg54: memref<512xf32>, %arg55: memref<512xf32>, %arg56: memref<512xf32>, %arg57: memref<512xf32>, %arg58: memref<512xf32>, %arg59: memref<512xf32>, %arg60: memref<512x512x3x3xf32>, %arg61: memref<512x512x3x3xf32>, %arg62: memref<i64>, %arg63: memref<64xf32>, %arg64: memref<64xf32>, %arg65: memref<i64>, %arg66: memref<64xf32>, %arg67: memref<64xf32>, %arg68: memref<i64>, %arg69: memref<64xf32>, %arg70: memref<64xf32>, %arg71: memref<i64>, %arg72: memref<64xf32>, %arg73: memref<64xf32>, %arg74: memref<i64>, %arg75: memref<64xf32>, %arg76: memref<64xf32>, %arg77: memref<i64>, %arg78: memref<128xf32>, %arg79: memref<128xf32>, %arg80: memref<i64>, %arg81: memref<128xf32>, %arg82: memref<128xf32>, %arg83: memref<i64>, %arg84: memref<128xf32>, %arg85: memref<128xf32>, %arg86: memref<i64>, %arg87: memref<128xf32>, %arg88: memref<128xf32>, %arg89: memref<i64>, %arg90: memref<128xf32>, %arg91: memref<128xf32>, %arg92: memref<i64>, %arg93: memref<256xf32>, %arg94: memref<256xf32>, %arg95: memref<i64>, %arg96: memref<256xf32>, %arg97: memref<256xf32>, %arg98: memref<i64>, %arg99: memref<256xf32>, %arg100: memref<256xf32>, %arg101: memref<i64>, %arg102: memref<256xf32>, %arg103: memref<256xf32>, %arg104: memref<i64>, %arg105: memref<256xf32>, %arg106: memref<256xf32>, %arg107: memref<i64>, %arg108: memref<512xf32>, %arg109: memref<512xf32>, %arg110: memref<i64>, %arg111: memref<512xf32>, %arg112: memref<512xf32>, %arg113: memref<i64>, %arg114: memref<512xf32>, %arg115: memref<512xf32>, %arg116: memref<i64>, %arg117: memref<512xf32>, %arg118: memref<512xf32>, %arg119: memref<i64>, %arg120: memref<512xf32>, %arg121: memref<512xf32>, %arg122: memref<1x3x224x224xf32>) -> (memref<1x1000xf16>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<64x3x7x7xf16>, memref<1x3x224x224xf16>, memref<1x64x112x112xf16>, memref<1x64x112x112xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<128x64x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<128x64x1x1xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<256x128x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<256x128x1x1xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<512x256x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<512x256x1x1xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<1x512xf16>, memref<512x1000xf16>) {
    %alloc = memref.alloc() : memref<f16>
    "lmhlo.constant"(%alloc) {value = dense<0.000000e+00> : tensor<f16>} : (memref<f16>) -> ()
    %alloc_0 = memref.alloc() : memref<f16>
    "lmhlo.constant"(%alloc_0) {value = dense<0xFC00> : tensor<f16>} : (memref<f16>) -> ()
    %0 = call @Unknown0(%arg122) : (memref<1x3x224x224xf32>) -> memref<1x3x224x224xf16>
    %1 = call @Unknown1(%arg2) : (memref<64x3x7x7xf32>) -> memref<64x3x7x7xf16>
    %alloc_1 = memref.alloc() : memref<1x64x112x112xf16>
    lmhlo.convolution(%0, %1, %alloc_1) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[3, 3], [3, 3]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x3x224x224xf16>, memref<64x3x7x7xf16>, memref<1x64x112x112xf16>) -> ()
    %2:3 = call @BatchNormTrainingOp2(%alloc_1, %arg1, %arg0) : (memref<1x64x112x112xf16>, memref<64xf32>, memref<64xf32>) -> (memref<1x64x112x112xf16>, memref<64xf32>, memref<64xf32>)
    %3 = call @Unknown3(%2#0) : (memref<1x64x112x112xf16>) -> memref<1x64x112x112xf16>
    %alloc_2 = memref.alloc() : memref<1x64x56x56xf16>
    "lmhlo.reduce_window"(%3, %alloc_0, %alloc_2) ({
    ^bb0(%arg123: memref<f16>, %arg124: memref<f16>, %arg125: memref<f16>):
      %alloc_25 = memref.alloc() : memref<f16>
      "lmhlo.maximum"(%arg123, %arg124, %alloc_25) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.copy"(%alloc_25, %arg125) : (memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {base_dilations = dense<1> : tensor<4xi64>, padding = dense<[[0, 0], [0, 0], [1, 1], [1, 1]]> : tensor<4x2xi64>, window_dilations = dense<1> : tensor<4xi64>, window_dimensions = dense<[1, 1, 3, 3]> : tensor<4xi64>, window_strides = dense<[1, 1, 2, 2]> : tensor<4xi64>} : (memref<1x64x112x112xf16>, memref<f16>, memref<1x64x56x56xf16>) -> ()
    %4 = call @Unknown4(%arg9) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %alloc_3 = memref.alloc() : memref<1x64x56x56xf16>
    lmhlo.convolution(%alloc_2, %4, %alloc_3) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>) -> ()
    %5:3 = call @BatchNormTrainingOp5(%alloc_3, %arg6, %arg5) : (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %6 = call @Unknown6(%5#0) : (memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16>
    %7 = call @Unknown7(%arg10) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %alloc_4 = memref.alloc() : memref<1x64x56x56xf16>
    lmhlo.convolution(%6, %7, %alloc_4) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>) -> ()
    %8:3 = call @BatchNormTrainingOp8(%alloc_4, %arg8, %arg7) : (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %9 = call @Unknown9(%8#0, %alloc_2) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16>
    %10 = call @Unknown10(%arg15) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %alloc_5 = memref.alloc() : memref<1x64x56x56xf16>
    lmhlo.convolution(%9, %10, %alloc_5) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>) -> ()
    %11:3 = call @BatchNormTrainingOp11(%alloc_5, %arg12, %arg11) : (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %12 = call @Unknown12(%11#0) : (memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16>
    %13 = call @Unknown13(%arg16) : (memref<64x64x3x3xf32>) -> memref<64x64x3x3xf16>
    %alloc_6 = memref.alloc() : memref<1x64x56x56xf16>
    lmhlo.convolution(%12, %13, %alloc_6) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>) -> ()
    %14:3 = call @BatchNormTrainingOp14(%alloc_6, %arg14, %arg13) : (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>) -> (memref<1x64x56x56xf16>, memref<64xf32>, memref<64xf32>)
    %15 = call @Unknown15(%14#0, %9) : (memref<1x64x56x56xf16>, memref<1x64x56x56xf16>) -> memref<1x64x56x56xf16>
    %16 = call @Unknown16(%arg23) : (memref<128x64x1x1xf32>) -> memref<128x64x1x1xf16>
    %alloc_7 = memref.alloc() : memref<1x128x28x28xf16>
    lmhlo.convolution(%15, %16, %alloc_7) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<128x64x1x1xf16>, memref<1x128x28x28xf16>) -> ()
    %17:3 = call @BatchNormTrainingOp17(%alloc_7, %arg25, %arg24) : (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %18 = call @Unknown18(%arg21) : (memref<128x64x3x3xf32>) -> memref<128x64x3x3xf16>
    %alloc_8 = memref.alloc() : memref<1x128x28x28xf16>
    lmhlo.convolution(%15, %18, %alloc_8) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x64x56x56xf16>, memref<128x64x3x3xf16>, memref<1x128x28x28xf16>) -> ()
    %19:3 = call @BatchNormTrainingOp19(%alloc_8, %arg18, %arg17) : (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %20 = call @Unknown20(%19#0) : (memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16>
    %21 = call @Unknown21(%arg22) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %alloc_9 = memref.alloc() : memref<1x128x28x28xf16>
    lmhlo.convolution(%20, %21, %alloc_9) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>) -> ()
    %22:3 = call @BatchNormTrainingOp22(%alloc_9, %arg20, %arg19) : (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %23 = call @Unknown23(%22#0, %17#0) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16>
    %24 = call @Unknown24(%arg30) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %alloc_10 = memref.alloc() : memref<1x128x28x28xf16>
    lmhlo.convolution(%23, %24, %alloc_10) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>) -> ()
    %25:3 = call @BatchNormTrainingOp25(%alloc_10, %arg27, %arg26) : (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %26 = call @Unknown26(%25#0) : (memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16>
    %27 = call @Unknown27(%arg31) : (memref<128x128x3x3xf32>) -> memref<128x128x3x3xf16>
    %alloc_11 = memref.alloc() : memref<1x128x28x28xf16>
    lmhlo.convolution(%26, %27, %alloc_11) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>) -> ()
    %28:3 = call @BatchNormTrainingOp28(%alloc_11, %arg29, %arg28) : (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>) -> (memref<1x128x28x28xf16>, memref<128xf32>, memref<128xf32>)
    %29 = call @Unknown29(%28#0, %23) : (memref<1x128x28x28xf16>, memref<1x128x28x28xf16>) -> memref<1x128x28x28xf16>
    %30 = call @Unknown30(%arg38) : (memref<256x128x1x1xf32>) -> memref<256x128x1x1xf16>
    %alloc_12 = memref.alloc() : memref<1x256x14x14xf16>
    lmhlo.convolution(%29, %30, %alloc_12) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x128x28x28xf16>, memref<256x128x1x1xf16>, memref<1x256x14x14xf16>) -> ()
    %31:3 = call @BatchNormTrainingOp31(%alloc_12, %arg40, %arg39) : (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %32 = call @Unknown32(%arg36) : (memref<256x128x3x3xf32>) -> memref<256x128x3x3xf16>
    %alloc_13 = memref.alloc() : memref<1x256x14x14xf16>
    lmhlo.convolution(%29, %32, %alloc_13) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x128x28x28xf16>, memref<256x128x3x3xf16>, memref<1x256x14x14xf16>) -> ()
    %33:3 = call @BatchNormTrainingOp33(%alloc_13, %arg33, %arg32) : (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %34 = call @Unknown34(%33#0) : (memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16>
    %35 = call @Unknown35(%arg37) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %alloc_14 = memref.alloc() : memref<1x256x14x14xf16>
    lmhlo.convolution(%34, %35, %alloc_14) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>) -> ()
    %36:3 = call @BatchNormTrainingOp36(%alloc_14, %arg35, %arg34) : (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %37 = call @Unknown37(%36#0, %31#0) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16>
    %38 = call @Unknown38(%arg45) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %alloc_15 = memref.alloc() : memref<1x256x14x14xf16>
    lmhlo.convolution(%37, %38, %alloc_15) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>) -> ()
    %39:3 = call @BatchNormTrainingOp39(%alloc_15, %arg42, %arg41) : (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %40 = call @Unknown40(%39#0) : (memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16>
    %41 = call @Unknown41(%arg46) : (memref<256x256x3x3xf32>) -> memref<256x256x3x3xf16>
    %alloc_16 = memref.alloc() : memref<1x256x14x14xf16>
    lmhlo.convolution(%40, %41, %alloc_16) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>) -> ()
    %42:3 = call @BatchNormTrainingOp42(%alloc_16, %arg44, %arg43) : (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>) -> (memref<1x256x14x14xf16>, memref<256xf32>, memref<256xf32>)
    %43 = call @Unknown43(%42#0, %37) : (memref<1x256x14x14xf16>, memref<1x256x14x14xf16>) -> memref<1x256x14x14xf16>
    %44 = call @Unknown44(%arg53) : (memref<512x256x1x1xf32>) -> memref<512x256x1x1xf16>
    %alloc_17 = memref.alloc() : memref<1x512x7x7xf16>
    lmhlo.convolution(%43, %44, %alloc_17) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[0, 0], [0, 0]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x256x14x14xf16>, memref<512x256x1x1xf16>, memref<1x512x7x7xf16>) -> ()
    %45:3 = call @BatchNormTrainingOp45(%alloc_17, %arg55, %arg54) : (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %46 = call @Unknown46(%arg51) : (memref<512x256x3x3xf32>) -> memref<512x256x3x3xf16>
    %alloc_18 = memref.alloc() : memref<1x512x7x7xf16>
    lmhlo.convolution(%43, %46, %alloc_18) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [2, 2], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x256x14x14xf16>, memref<512x256x3x3xf16>, memref<1x512x7x7xf16>) -> ()
    %47:3 = call @BatchNormTrainingOp47(%alloc_18, %arg48, %arg47) : (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %48 = call @Unknown48(%47#0) : (memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16>
    %49 = call @Unknown49(%arg52) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %alloc_19 = memref.alloc() : memref<1x512x7x7xf16>
    lmhlo.convolution(%48, %49, %alloc_19) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>) -> ()
    %50:3 = call @BatchNormTrainingOp50(%alloc_19, %arg50, %arg49) : (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %51 = call @Unknown51(%50#0, %45#0) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16>
    %52 = call @Unknown52(%arg60) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %alloc_20 = memref.alloc() : memref<1x512x7x7xf16>
    lmhlo.convolution(%51, %52, %alloc_20) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>) -> ()
    %53:3 = call @BatchNormTrainingOp53(%alloc_20, %arg57, %arg56) : (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %54 = call @Unknown54(%53#0) : (memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16>
    %55 = call @Unknown55(%arg61) : (memref<512x512x3x3xf32>) -> memref<512x512x3x3xf16>
    %alloc_21 = memref.alloc() : memref<1x512x7x7xf16>
    lmhlo.convolution(%54, %55, %alloc_21) dim_numbers = [b, f, 0, 1]x[o, i, 0, 1]->[b, f, 0, 1], window = {stride = [1, 1], pad = [[1, 1], [1, 1]], lhs_dilate = [1, 1], rhs_dilate = [1, 1]} {batch_group_count = 1 : i64, feature_group_count = 1 : i64, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>) -> ()
    %56:3 = call @BatchNormTrainingOp56(%alloc_21, %arg59, %arg58) : (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>) -> (memref<1x512x7x7xf16>, memref<512xf32>, memref<512xf32>)
    %57 = call @Unknown57(%56#0, %51) : (memref<1x512x7x7xf16>, memref<1x512x7x7xf16>) -> memref<1x512x7x7xf16>
    %alloc_22 = memref.alloc() : memref<1x512xf16>
    "lmhlo.reduce"(%57, %alloc, %alloc_22) ({
    ^bb0(%arg123: memref<f16>, %arg124: memref<f16>, %arg125: memref<f16>):
      "lmhlo.add"(%arg123, %arg124, %arg125) : (memref<f16>, memref<f16>, memref<f16>) -> ()
      "lmhlo.terminator"() : () -> ()
    }) {dimensions = dense<[3, 2]> : tensor<2xi64>} : (memref<1x512x7x7xf16>, memref<f16>, memref<1x512xf16>) -> ()
    %58 = call @Unknown58(%alloc_22) : (memref<1x512xf16>) -> memref<1x512xf16>
    %59 = call @Unknown59(%arg4) : (memref<1000x512xf32>) -> memref<1000x512xf16>
    %alloc_23 = memref.alloc() : memref<512x1000xf16>
    "lmhlo.transpose"(%59, %alloc_23) {minor_to_major = dense<[0, 1]> : tensor<2xindex>, permutation = dense<[1, 0]> : tensor<2xi64>} : (memref<1000x512xf16>, memref<512x1000xf16>) -> ()
    %alloc_24 = memref.alloc() : memref<1x1000xf16>
    "lmhlo.dot"(%58, %59, %alloc_24) {dot_dimension_numbers = #mhlo.dot<lhs_contracting_dimensions = [1], rhs_contracting_dimensions = [1]>, precision_config = [#mhlo<precision DEFAULT>, #mhlo<precision DEFAULT>]} : (memref<1x512xf16>, memref<1000x512xf16>, memref<1x1000xf16>) -> ()
    %60 = call @Unknown60(%arg3, %alloc_24) : (memref<1000xf32>, memref<1x1000xf16>) -> memref<1x1000xf16>
    %61 = call @Unknown61(%2#1, %arg63) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %62 = call @Unknown62(%2#2, %arg64) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %63 = call @Unknown63(%5#1, %arg66) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %64 = call @Unknown64(%5#2, %arg67) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %65 = call @Unknown65(%8#1, %arg69) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %66 = call @Unknown66(%8#2, %arg70) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %67 = call @Unknown67(%11#1, %arg72) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %68 = call @Unknown68(%11#2, %arg73) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %69 = call @Unknown69(%14#1, %arg75) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %70 = call @Unknown70(%14#2, %arg76) : (memref<64xf32>, memref<64xf32>) -> memref<64xf32>
    %71 = call @Unknown71(%19#1, %arg78) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %72 = call @Unknown72(%19#2, %arg79) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %73 = call @Unknown73(%22#1, %arg81) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %74 = call @Unknown74(%22#2, %arg82) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %75 = call @Unknown75(%17#1, %arg84) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %76 = call @Unknown76(%17#2, %arg85) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %77 = call @Unknown77(%25#1, %arg87) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %78 = call @Unknown78(%25#2, %arg88) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %79 = call @Unknown79(%28#1, %arg90) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %80 = call @Unknown80(%28#2, %arg91) : (memref<128xf32>, memref<128xf32>) -> memref<128xf32>
    %81 = call @Unknown81(%33#1, %arg93) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %82 = call @Unknown82(%33#2, %arg94) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %83 = call @Unknown83(%36#1, %arg96) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %84 = call @Unknown84(%36#2, %arg97) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %85 = call @Unknown85(%31#1, %arg99) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %86 = call @Unknown86(%31#2, %arg100) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %87 = call @Unknown87(%39#1, %arg102) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %88 = call @Unknown88(%39#2, %arg103) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %89 = call @Unknown89(%42#1, %arg105) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %90 = call @Unknown90(%42#2, %arg106) : (memref<256xf32>, memref<256xf32>) -> memref<256xf32>
    %91 = call @Unknown91(%47#1, %arg108) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %92 = call @Unknown92(%47#2, %arg109) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %93 = call @Unknown93(%50#1, %arg111) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %94 = call @Unknown94(%50#2, %arg112) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %95 = call @Unknown95(%45#1, %arg114) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %96 = call @Unknown96(%45#2, %arg115) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %97 = call @Unknown97(%53#1, %arg117) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %98 = call @Unknown98(%53#2, %arg118) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %99 = call @Unknown99(%56#1, %arg120) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    %100 = call @Unknown100(%56#2, %arg121) : (memref<512xf32>, memref<512xf32>) -> memref<512xf32>
    return %60, %arg0, %arg1, %arg5, %arg6, %arg7, %arg8, %arg11, %arg12, %arg13, %arg14, %arg17, %arg18, %arg19, %arg20, %arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg32, %arg33, %arg34, %arg35, %arg39, %arg40, %arg41, %arg42, %arg43, %arg44, %arg47, %arg48, %arg49, %arg50, %arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %61, %62, %63, %64, %65, %66, %67, %68, %69, %70, %71, %72, %73, %74, %75, %76, %77, %78, %79, %80, %81, %82, %83, %84, %85, %86, %87, %88, %89, %90, %91, %92, %93, %94, %95, %96, %97, %98, %99, %100, %1, %0, %alloc_1, %3, %alloc_2, %4, %alloc_3, %6, %7, %alloc_4, %9, %10, %alloc_5, %12, %13, %alloc_6, %15, %18, %alloc_8, %20, %21, %alloc_9, %16, %alloc_7, %23, %24, %alloc_10, %26, %27, %alloc_11, %29, %32, %alloc_13, %34, %35, %alloc_14, %30, %alloc_12, %37, %38, %alloc_15, %40, %41, %alloc_16, %43, %46, %alloc_18, %48, %49, %alloc_19, %44, %alloc_17, %51, %52, %alloc_20, %54, %55, %alloc_21, %57, %58, %alloc_23 : memref<1x1000xf16>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<64xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<256xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<512xf32>, memref<64x3x7x7xf16>, memref<1x3x224x224xf16>, memref<1x64x112x112xf16>, memref<1x64x112x112xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<64x64x3x3xf16>, memref<1x64x56x56xf16>, memref<1x64x56x56xf16>, memref<128x64x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<128x64x1x1xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<128x128x3x3xf16>, memref<1x128x28x28xf16>, memref<1x128x28x28xf16>, memref<256x128x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<256x128x1x1xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<256x256x3x3xf16>, memref<1x256x14x14xf16>, memref<1x256x14x14xf16>, memref<512x256x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<512x256x1x1xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<512x512x3x3xf16>, memref<1x512x7x7xf16>, memref<1x512x7x7xf16>, memref<1x512xf16>, memref<512x1000xf16>
  }
}