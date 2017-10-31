cmake_minimum_required(VERSION 3.8)
project(grandforest)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        cpp_version/src/utility/ArgumentHandler.cpp
        cpp_version/src/utility/ArgumentHandler.h
        cpp_version/src/main.cpp
        cpp_version/src/version.h
        cpp_version/test/test_all.cpp
        cpp_version/test/utility_test.cpp
        inst/include/ranger.h
        src/AAA_check_cpp11.cpp
        src/Data.cpp
        src/Data.h
        src/DataChar.cpp
        src/DataChar.h
        src/DataDouble.cpp
        src/DataDouble.h
        src/DataFloat.cpp
        src/DataFloat.h
        src/DataSparse.cpp
        src/DataSparse.h
        src/Forest.cpp
        src/Forest.h
        src/ForestClassification.cpp
        src/ForestClassification.h
        src/ForestProbability.cpp
        src/ForestProbability.h
        src/ForestRegression.cpp
        src/ForestRegression.h
        src/ForestSurvival.cpp
        src/ForestSurvival.h
        src/globals.h
        src/Graph.cpp
        src/Graph.h
        src/ranger_init.c
        src/rangerCpp.cpp
        src/RcppExports.cpp
        src/Tree.cpp
        src/Tree.h
        src/TreeClassification.cpp
        src/TreeClassification.h
        src/TreeProbability.cpp
        src/TreeProbability.h
        src/TreeRegression.cpp
        src/TreeRegression.h
        src/TreeSurvival.cpp
        src/TreeSurvival.h
        src/utility.cpp
        src/utility.h)

add_executable(grandforest ${SOURCE_FILES})