# DuckDB Android

This is a fork of the duckdb to play around with building it on android.
If you were after the official duckdb database repository then it's at [duckdb](https://github.com/duckdb/duckdb).

Currently it's only building without extensions. See [build_android.sh](build_android.sh).

## Build Instructions

Edit [android_env.sh](android_env.sh) and set `ANDROID_NDK=path to your android NDK` or 
install android studio and use the "SDK Manager" to install Android NDK version 26.3.11579264 if you 
don't have it. Set the `ANDROID_ABI` to the android architecture you want to build for.
eg: arm64-v8a.


Run [build_android.sh](build_android.sh)

## Issues

Extensions do not build. For example: `BUILD_ICU=1` leads to:
```
In file included from /home/dan/workspace/duckdb/duckdb/build/release_android34_x86_64/extension/icu/third_party/icu/i18n/ub_duckdb_icu_i18n.cpp:>
/home/dan/workspace/duckdb/duckdb/extension/icu/third_party/icu/i18n/plurrule.cpp:1665:24: warning: implicit conversion from 'int64_t' (aka 'long>
          if (scaled > U_INT64_MAX) {
                     ~ ^~~~~~~~~~~
/home/dan/workspace/duckdb/duckdb/extension/icu/third_party/icu/common/unicode/umachine.h:248:33: note: expanded from macro 'U_INT64_MAX'
#     define U_INT64_MAX       ((int64_t)(INT64_C(9223372036854775807)))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.
[269/278] : && /usr/bin/cmake -E rm -f extension/icu/libicu_extension.a && /mnt/files/sdk/android/ndk/26.3.11579264/toolchains/llvm/prebuilt/linu>
[270/278] : && /mnt/files/sdk/android/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=x86_64-none-linux-android34 -->
FAILED: extension/icu/icu.duckdb_extension
: && /mnt/files/sdk/android/ndk/26.3.11579264/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target=x86_64-none-linux-android34 --sysroot=/m>
ld.lld: error: undefined symbol: duckdb::Timestamp::Convert(duckdb::timestamp_t, duckdb::date_t&, duckdb::dtime_t&)
>>> referenced by icu-dateadd.cpp:78 (/home/dan/workspace/duckdb/duckdb/extension/icu/icu-dateadd.cpp:78)
```




