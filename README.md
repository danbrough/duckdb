# DuckDB Android

This is a fork of the duckdb to play around with building it on android.
If you were after the official duckdb database repository then it's at [duckdb](https://github.com/duckdb/duckdb).

Currently it's only building without extensions. See [build_android.sh](build_android.sh).

## Build Instructions

Edit [android_env.sh](android_env.sh) and set `ANDROID_NDK=path to your android NDK` or 
install android studio and use the "SDK Manager" to install Android NDK version 26.3.11579264 if you 
don't have it.

Run [build_android.sh](build_android.sh)







