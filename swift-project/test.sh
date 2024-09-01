#!/bin/bash

# Get the absolute path to the Swift project root directory
PROJECT_DIR="/Users/jan/Downloads/Dev/swift-project"

# Get the arguments
MODE=$1
TEST=$2

# Change to the build directory within the project
pushd "${PROJECT_DIR}/build/${MODE}/swift-macosx-arm64" || exit

# Run ninja to build swift-frontend
ninja -j 8 bin/swift-frontend

# Return to the original directory
popd || exit

# Run lit tests
python3 "${PROJECT_DIR}/llvm-project/llvm/utils/lit/lit.py" -sv --param swift_site_config="${PROJECT_DIR}/build/${MODE}/swift-macosx-arm64/test-macosx-arm64/lit.site.cfg" "${PROJECT_DIR}/${TEST}"

