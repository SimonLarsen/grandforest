Grand Forest
============

A graph-guided Random Forest algorithm

## Introduction

Grand Forest is a graph-guided Random Forest algorithm, integrating secondary graph-structured data in order guide the feature selection towards interacting features. Grand Forest is based on [ranger](https://github.com/imbs-hl/ranger).

ranger is a fast implementation of random forest (Breiman 2001) or recursive partitioning, particularly suited for high dimensional data. Classification, regression, probability estimation and survival forests are supported. Classification and regression forests are implemented as in the original Random Forest (Breiman 2001), survival forests as in Random Survival Forests (Ishwaran et al. 2008). For probability estimation forests see Malley et al. (2012).

## Installation

### R version

To install the latest development version of the R package run:

```R
devtools::install_github("SimonLarsen/grandforest")
```

### Standalone C++ version

To install the C++ version of Grand Forest in Linux or Mac OS X, you will need a compiler supporting C++11 and CMake. To build start a terminal from the main directory and run the following commands

```bash
cd cpp_version
mkdir build
cd build
cmake ..
make
```

After compilation there should be an executable called "grandforest" in the build directory.

To run the C++ version in Microsoft Windows please cross compile or ask for a binary.

## Reporting bugs

If you find any bugs, or if you experience any crashes, please report to us. If you have any questions just ask, we won't bite.

## Citation

If you use Grand Forest in your research, we kindly ask you to cite the following publication:

    Citation details to be announced.
