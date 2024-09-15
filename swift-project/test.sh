#!/bin/bash

PROJECT_DIR="/Users/jan/Downloads/Dev/swift-project"

MODE=$1
TEST=$2

pushd "${PROJECT_DIR}/build/${MODE}/swift-macosx-arm64"

ninja -j 8 bin/swift-frontend

# Return to the original directory
popd

python3 "${PROJECT_DIR}/llvm-project/llvm/utils/lit/lit.py" -sv --param swift_site_config="${PROJECT_DIR}/build/${MODE}/swift-macosx-arm64/test-macosx-arm64/lit.site.cfg" "${PROJECT_DIR}/${TEST}"

