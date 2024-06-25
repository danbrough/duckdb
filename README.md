# DuckDB Android

This is a fork of the duckdb to play around with building it on android.
Turns out a "fork" was overkill but all you need is something like the [build_android.sh](./build_android.sh) script here.

Working with built-in extensions parquet, icu, jemalloc, shell and json.
Edit the [build_android.sh](./build_android.sh) script and run it and you should wind up with a statically linked binary
at ./build/android_../duckdb and also a shared library you could use with the duckdb java library.












