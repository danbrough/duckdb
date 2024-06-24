#!/bin/bash


source android_env.sh

export DUCKDB_PLATFORM=android${ANDROID_API}_${ANDROID_ABI}
export BUILD_ICU=1
export BUILD_PARQUET=0
export BUILD_UNITTESTS=false

GEN=ninja make  | tee build_${DUCKDB_PLATFORM}.log 2>&1




