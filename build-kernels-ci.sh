#!/bin/sh

export ANDROID_BUILD_TOP=/srv/android
export ANDROID_ROOT=$ANDROID_BUILD_TOP

export MKDTIMG=$ANDROID_ROOT/out/host/linux-x86/bin/mkdtimg

# Does not work in CI context:
#. "${0%/*}/build_shared_vars.sh -k true -d apollo"
. "${0%/*}/build_shared_vars.sh"

export CLANG=$ANDROID_ROOT/prebuilts/clang/host/linux-x86/clang-r353983c/bin/

export VARIANT=ci-clang

export keep_kernel_tmp=true
export build_directory=$ANDROID_ROOT/out/$VARIANT/kernel-tmp
# For faster testing:
#export only_build_for=apollo

# Cross Compiler
CC="clang"

# Build command
BUILD_ARGS="CLANG_TRIPLE=aarch64-linux-gnu"

PATH=$CLANG:$PATH
# source shared parts
. "${0%/*}/build_shared.sh"
