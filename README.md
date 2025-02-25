# The ByteIR Project 

English | [中文](README-zh_cn.md)

The ByteIR Project is a ByteDance model compilation solution.
ByteIR includes compiler, runtime, and frontends, and provides an end-to-end model compilation solution.

Although all ByteIR components (compiler/runtime/frontends) are together to provide an end-to-end solution, and 
all under the same umbrella of this repository, 
each component technically can perform independently.

## The name ByteIR
The name, ByteIR, comes from a legacy purpose internally.   
The ByteIR project is NOT an IR spec definition project. 
Instead, in most scenarios, ByteIR directly uses several upstream MLIR dialects and Google Mhlo.
Most of ByteIR compiler passes are compatible with the selected upstream MLIR dialects and Google Mhlo.

## Why ByteIR
* **Enjoy SOTA models:**
ByteIR maintains the popular frontends to handle lowering many SOTA models into Mhlo, and also provides a model zoo (release soon) for research or benchmarking purposes. 
* **Just work:**
ByteIR adopts upstream MLIR dialects and Google Mhlo, and provides compatible passes, utilities, and infrastructure for all compiler builders using upstream MLIR. You can mix using ByteIR passes with upstream MLIR or Mhlo passes, or even your own passes to build your pipeline.  
* **Bring your own architecture:**
ByteIR provides rich generic graph-, loop-, tensor-level, optimizations in Mhlo and Linalg, which allow DL ASIC compilers to reuse, and focus only on the last mile for their backends.  

## Project Status
ByteIR is still in its early phase. 
In this phase, we are aiming to provide well-defined, necessary building blocks and infrastructure support for model compilation in a wide-range of deep learning accelerators as well as general-purpose CPUs and GPUs.
Therefore, highly-tuned kernels for specific architecture might not have been prioritized. 
For sure, any feedback for prioritizing specific architecture or corresponding contribution are welcome.

## [Compiler](compiler/README.md)

ByteIR Compiler is an MLIR-based compiler for CPU/GPU/ASIC.

## [Runtime](runtime/README.md)

ByteIR Runtime is a common, lightweight runtime, capable to serving both existing kernels and ByteIR compiler generated kernels.

## [Frontends](frontends/README.md)

ByteIR Frontends includes Tensorflow, PyTorch, and ONNX.


## Components Communication Interface
Each ByteIR component technically can perform independently.
There are pre-defined communication interface between components.

### MHLO between frontends and compiler
ByteIR frontends and ByteIR compiler communicate through Mhlo dialect, which version might be updated during development.

This also implies whatever frontend generating Mhlo with a compatible version can work with ByteIR compiler, and also whatever compiler consuming Mhlo with a compatible version can work with ByteIR frontends.

### ByRE between compiler and runtime

ByteIR compiler and ByteIR runtime communicates through ByRE format, which version might be updated during development.
ByRE dialect is defined as a kind of ByRE format in ByteIR compiler, 
currently supporting a textual form for ByteIR compiler and runtime.

The bytecode form of ByRE dialect with versioning will come very soon.
Other ByRE formats are under development.


## Publication and Citation

ByteIR is the product of many great researchers and interns in ByteDance. Below is a list of our publications:

* [Linalg is All You Need to Optimize Attention](compiler/paper/c4ml23_poster.pdf) -- C4ML'23


If you find ByteIR useful, please consider citing.
``` 
@misc{byteir2023,
title = {{ByteIR}},
author = {Cao, Honghua and Chang, Li-Wen and Chen, Chongsong and Jiang, Chengquan and Jiang, Ziheng and Liu, Liyang and Liu, Yuan and Liu, Yuanqiang and Shen, Chao and Wang, Haoran and Xiao, Jianzhe and Yao, Chengji and Yuan, Hangjian and Zhang, Fucheng and Zhang, Ru and Zhang, Xuanrun and Zhang, Zhekun and Zhang, Zhiwei and Zhu, Hongyu and Liu, Xin},
url = {https://github.com//bytedance/byteir},
year = {2023}
}
```

## [License](LICENSE)

The ByteIR Project is under the Apache License v2.0
