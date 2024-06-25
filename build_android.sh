#!/bin/bash

#  wget https://dl.google.com/android/repository/android-ndk-r26d-linux.zip

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

export BUILD_HTTPFS=1
export BUILD_JEMALLOC=1
export BUILD_JSON=1
export BUILD_ICU=1
export BUILD_AUTOCOMPLETE=0


export ANDROID_API=34
#export ANDROID_ABI=x86_64
export ANDROID_ABI=arm64-v8a
export ANDROID_NDK="${PWD}/ndk"

export EXTENSION_STATIC_BUILD=1
export DUCKDB_PLATFORM=android_$ANDROID_ABI
export DUCKDB_CUSTOM_PLATFORM=$DUCKDB_PLATFORM

export OPENSSL_DIR=/home/dan/workspace/xtras/xtras/libs/openssl/3.3.1/androidNativeX64
export OPENSSL_ROOT_DIR=$OPENSSL_DIR
export OPENSSL_CRYPTO_LIBRARY=$OPENSSL_ROOT_DIR/lib/libcrypto.a
export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT_DIR/include

export CMAKE_VARS_BUILD="-DBUILD_UNITTESTS=0 -DCMAKE_VERBOSE_MAKEFILE=on -DBUILD_SHELL=0 \
-DANDROID_PLATFORM=$ANDROID_API \
-DOPENSSL_ROOT_DIR=$OPENSSL_ROOT_DIR -DOPENSSL_CRYPTO_LIBRARY=$OPENSSL_CRYPTO_LIBRARY -DOPENSSL_INCLUDE_DIR=$OPENSSL_INCLUDE_DIR \
-DOPENSSL_SSL_LIBRARY=$OPENSSL_DIR/lib/libssl.a \
-DANDROID_ABI=$ANDROID_ABI -DCMAKE_TOOLCHAIN_FILE=$PWD/android-ndk/build/cmake/android.toolchain.cmake"



make -j4  | tee build_$DUCKDB_PLATFORM.log 2>&1



