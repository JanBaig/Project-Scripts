#!/bin/bash

PROJECT_DIR="/Users/jan/Downloads/Dev/swift-project"
TEST=$1

# Ensure that the output directory for the final executable exists
OUTPUT_DIR="${PROJECT_DIR}/jan-tests"
mkdir -p ${OUTPUT_DIR}

# Get the base name of the test file without extension
BASENAME=$(basename "${TEST}" .swift)

# Remove any existing executable before attempting to compile
if [ -f "${OUTPUT_DIR}/${BASENAME}" ]; then
    rm "${OUTPUT_DIR}/${BASENAME}"
fi

# Compile and link in one step, producing the executable directly in the jan-tests directory
${PROJECT_DIR}/build/Ninja-DebugAssert/swift-macosx-arm64/bin/swiftc -sdk $(xcrun --show-sdk-path) "${PROJECT_DIR}/${TEST}" -o "${OUTPUT_DIR}/${BASENAME}"

# Check if the compilation was successful and the executable exists
if [ $? -eq 0 ] && [ -f "${OUTPUT_DIR}/${BASENAME}" ]; then
    echo "Executable created at ${OUTPUT_DIR}/${BASENAME}"
else
    echo "Compilation failed or the executable was not created."
fi

