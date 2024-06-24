#!/bin/bash



if [ -z "$ANDROID_NDK" ]; then 
	export ANDROID_NDK=/mnt/files/sdk/android/ndk/26.3.11579264
	echo ANDROID_NDK not set using default $ANDROID_NDK
fi

	
export ANDROID_API=34
#ANDROID_ABI=arm64-v8a
export ANDROID_ABI=x86_64


