#!/bin/bash


source android_env.sh

export DUCKDB_PLATFORM=android${ANDROID_API}_${ANDROID_ABI}

#Only extensions that seems to build is jemalloc:  export BUILD_JEMALLOC=1

#export BUILD_ICU=1
export DISABLE_ICU=1
export DISABLE_PARQUET=1
export BUILD_UNITTESTS=false

GEN=ninja make  | tee build_${DUCKDB_PLATFORM}.log 2>&1




