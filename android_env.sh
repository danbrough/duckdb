#!/bin/bash

if [ -z "$ANDROID_NDK" ]; then
  echo ANDROID_NDK not set. Edit android_env.sh to add something like ANDROID_NDK=/mnt/files/sdk/android/ndk/26.3.11579264 >&2
  exit 1
fi

#export ANDROID_NDK=/mnt/files/sdk/android/ndk/26.3.11579264

export ANDROID_API=34
#ANDROID_ABI=arm64-v8a
export ANDROID_ABI=x86_64


