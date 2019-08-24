# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/ospray.install/ospray.install.png" width="48" height="48"/> [Intel® OSPRay (Install)](https://chocolatey.org/packages/ospray.install)

## Prerequisites
Your CPU must support at least SSE4.1 to run OSPRay. The TGZ/ZIP packages contain most needed 3rd party dependencies, whereas for the (much smaller) RPM/installer packages you need to have installed:

- Intel® [TBB](https://www.threadingbuildingblocks.org) v3.0 or newer
- [Embree](https://embree.github.io) ray tracing kernels v3.1 or newer
- To run the example viewer: OpenGL
- To use the distributed, multi-node rendering feature: Intel® [MPI Library](https://software.intel.com/en-us/intel-mpi-library).
We recommend the latest version of both TBB and Embree libraries.

## Overview
Intel OSPRay is an **o**pen source, **s**calable, and **p**ortable **ray** tracing engine for high-performance, high-fidelity visualization on Intel Architecture CPUs. OSPRay is part of the [Intel oneAPI Rendering Toolkit](https://software.intel.com/en-us/rendering-framework) and is released under the permissive [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0).
The purpose of OSPRay is to provide an open, powerful, and easy-to-use rendering library that allows one to easily build applications that use ray tracing based rendering for interactive applications (including both surface- and volume-based visualizations). OSPRay is completely CPU-based, and runs on anything from laptops, to workstations, to compute nodes in HPC systems.
OSPRay internally builds on top of [Intel Embree](http://www.apache.org/licenses/LICENSE-2.0) and [ISPC (Intel SPMD Program Compiler)](https://ispc.github.io), and fully exploits modern instruction sets like Intel SSE4, AVX, AVX2, and AVX-512 to achieve high rendering performance, thus a CPU with support for at least SSE4.1 is required to run OSPRay.

![screenshot](https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/ospray.install/screenshot.png)