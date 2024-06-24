#!/bin/bash



export BUILD_JEMALLOC=1
export BUILD_HTTPFS=1
export BUILD_JSON=1
export BUILD_ICU=1
export BUILD_PARQUET=1
export BUILD_UNITTESTS=false

GEN=ninja make release_original  | tee build_linux.log 2>&1




