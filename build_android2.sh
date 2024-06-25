#!/bin/bash

[ -d android-ndk ] && ANDROID_NDK="$PWD/android-ndk"

if [ -z "$ANDROID_NDK" ]; then
  URL=https://dl.google.com/android/repository/android-ndk-r26d-linux.zip
  echo ANDROID_NDK not set .. downloading $URL
  wget $URL && \
  unzip android-ndk-r26d-linux.zip && \
  mv android-ndk-r26d-linux android-ndk
fi

#ANDROID_ABI=arm64-v8a
ANDROID_ABI=x86_64

PLATFORM_NAME="android_$ANDROID_ABI"
mkdir -p ./build/$PLATFORM_NAME && \
cd ./build/$PLATFORM_NAME && \
cmake -G "Ninja" -DFORCE_COLORED_OUTPUT=1 -DEXTENSION_STATIC_BUILD=1 \
-DENABLE_EXTENSION_AUTOLOADING=1 -DENABLE_EXTENSION_AUTOINSTALL=1 \
-DDUCKDB_EXTRA_LINK_FLAGS="-llog" \
-DBUILD_EXTENSIONS="icu;parquet;json;jemalloc" \
-DCMAKE_VERBOSE_MAKEFILE=on \
-DLOCAL_EXTENSION_REPO=""  -DOVERRIDE_GIT_DESCRIBE="" \
-DDUCKDB_EXPLICIT_PLATFORM=$PLATFORM_NAME -DBUILD_UNITTESTS=0 -DBUILD_SHELL=1 \
-DANDROID_ABI=$ANDROID_ABI -DCMAKE_TOOLCHAIN_FILE=./android-ndk/build/cmake/android.toolchain.cmake \
-DCMAKE_BUILD_TYPE=Release ../.. && \
cmake --build . --config Release
