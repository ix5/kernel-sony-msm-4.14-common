#!/bin/sh

export ANDROID_ROOT=/srv/android
export MKDTIMG=$ANDROID_ROOT/out/host/linux-x86/bin/mkdtimg

#. "${0%/*}/build_shared_vars.sh -k true -d apollo"
. "${0%/*}/build_shared_vars.sh"

export CLANG=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r353983c/bin/

# Cross Compiler
CC="clang"

# Build command
BUILD_ARGS="CLANG_TRIPLE=aarch64-linux-gnu"

PATH=$CLANG:$PATH
# source shared parts
. "${0%/*}/build_shared.sh"
