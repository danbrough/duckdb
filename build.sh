#!/bin/bash




#export NDKDIR=/mnt/files/sdk/android/ndk/25.2.9519653
#export NDKDIR=/mnt/files/sdk/android/ndk/24.0.8215888

export ANDROID_NDK=/mnt/files/sdk/android/ndk/26.3.11579264
export ANDROID_API=34
#ANDROID_ABI=arm64-v8a
export ANDROID_ABI=x86_64
export DUCKDB_PLATFORM=android${ANDROID_API}_${ANDROID_ABI}


export BUILD_ICU=0
export BUILD_PARQUET=0

GEN=ninja make | tee build_${DUCKDB_PLATFORM}.log 2>&1




