#!/bin/bash


source android_env.sh


export BUILD_UNITTESTS=false
export ENABLE_EXTENSION_AUTOLOADING=1
export ENABLE_EXTENSION_AUTOINSTALL=1
export GEN=ninja
export EXTENSION_STATIC_BUILD=1
export DUCKDB_PLATFORM=android_${ANDROID_ABI}
export DUCKDB_CUSTOM_PLATFORM=android_${ANDROID_ABI}

export CMAKE_VARS_BUILD="-DBUILD_UNITTESTS=0 -DBUILD_SHELL=0 -DANDROID_ABI=${ANDROID_ABI} -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK}/build/cmake/android.toolchain.cmake"

echo CMAKE_VARS_BUILD = $CMAKE_VARS_BUILD
exit 0
make  | tee build_${DUCKDB_PLATFORM}.log 2>&1




