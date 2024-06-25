# DuckDB Android

This is a fork of the duckdb to play around with building it on android.
Turns out a "fork" was overkill but all you need is something like the [build_android.sh](./build_android.sh) script here.

Working with built-in extensions parquet, icu, jemalloc, shell and json.
Edit the [build_android.sh](./build_android.sh) script and run it and you should wind up with a statically linked binary
at ./build/android_../duckdb and also a shared library you could use with the duckdb java library.

Currently testing with NDK 26.3.11579264, clang14, cmake: 3.29.6-1 and duckdb: 1cd1df5bc9c73bb5b043aa0c8426a09a765f209d














