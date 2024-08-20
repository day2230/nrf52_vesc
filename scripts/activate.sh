#!/usr/bin/env bash

if [ "$(realpath "$0")" = "$(realpath "$BASH_SOURCE")" ]; then
    echo "Source this script instead of running it."
    echo "Ex: $ . scripts/activate.sh"
    exit 1
fi

SCRIPT_DIR=$(realpath $(dirname "$BASH_SOURCE"))
SDK_DIR=$(realpath -m "$SCRIPT_DIR/../external/nRF5_SDK_15.3.0_59ac345")
GCC_DIR=$(realpath -m "$SCRIPT_DIR/../external/gcc-arm-none-eabi-7-2018-q2-update")

##### Configure nRF5 SDK #####
export SDK_ROOT="$SDK_DIR"

##### Configure GCC #####
export GNU_INSTALL_ROOT="$GCC_DIR/bin/"
export GNU_VERSION="7.3.1"
export GNU_PREFIX="arm-none-eabi"

echo "Environment variables for GCC and nRF SDK exported!"
