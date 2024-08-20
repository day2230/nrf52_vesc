#!/usr/bin/env bash

set -e

if [ "$(realpath "$0")" != "$(realpath "$BASH_SOURCE")" ]; then
    echo "Run this script directly. Do not source it."
    exit 1
fi

SCRIPT_DIR=$(realpath $(dirname "$BASH_SOURCE"))
OUT_DIR=$(realpath -m "$SCRIPT_DIR/../external")

##### Install nRF5 SDK #####
SDK_URL="https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip"
SDK_NAME=$(basename "$SDK_URL")

if [ ! -f "$OUT_DIR/$SDK_NAME" ]; then
    cd "$OUT_DIR" && curl -OJL "$SDK_URL"
fi
cd "$OUT_DIR" && unzip "$SDK_NAME"

##### Install GCC #####
GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2"
GCC_NAME=$(basename "$GCC_URL")

if [ ! -f "$OUT_DIR/$GCC_NAME" ]; then
    cd "$OUT_DIR" && curl -OJL "$GCC_URL"
fi

cd "$OUT_DIR" && tar xvjf "$GCC_NAME"

echo "GCC and nRF5 SDK now installed to ./external"
