#!/bin/bash


export GEN=ninja
export ENABLE_EXTENSION_AUTOLOADING=1
export ENABLE_EXTENSION_AUTOINSTALL=1
export CC=clang
export CPP=clang-cpp
export CXX=clang++
#export EXTENSION_CONFIGS="${PWD}/.github/config/bundled_extensions.cmake"
#export BUILD_BENCHMARK=1
export DEBUG_STACKTRACE=1
export FORCE_WARN_UNUSED=1
#export DUCKDB_RUN_PARALLEL_CSV_TESTS=1
export CMAKE_VARS_BUILD="-DBUILD_UNITTESTS=0 -DCMAKE_VERBOSE_MAKEFILE=on"
export BUILD_HTTPFS=1
export BUILD_JEMALLOC=1
export BUILD_HTTPFS=1
export BUILD_JSON=1
export BUILD_ICU=1
export BUILD_AUTOCOMPLETE=1

make -j4  | tee build_linux.log 2>&1



