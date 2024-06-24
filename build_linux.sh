#!/bin/bash



export BUILD_ICU=1
export BUILD_PARQUET=0
export DISABLE_PARQUET=1
export BUILD_UNITTESTS=false
export DISABLE_BUILTIN_EXTENSIONS=TRUE

GEN=ninja make release_original  | tee build_linux.log 2>&1




