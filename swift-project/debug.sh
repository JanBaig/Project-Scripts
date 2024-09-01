
#!/bin/bash

# Define the project directory
PROJECT_DIR="/Users/jan/Downloads/Dev/swift-project"

# Check if the build variant and input Swift file are provided as arguments
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <build-variant> <swift-file>"
  exit 1
fi

# Get the build variant and Swift file from the arguments
BUILD_VARIANT=$1
SWIFT_FILE=$2

# Construct the path to the swiftc binary
SWIFTC_PATH="$PROJECT_DIR/build/$BUILD_VARIANT/swift-macosx-arm64/bin/swiftc"

# Use the -### flag to get the frontend invocation and pipe it to split-cmdline
CMD_OUTPUT=$("$SWIFTC_PATH" "$SWIFT_FILE" -### | "$PROJECT_DIR/swift/utils/dev-scripts/split-cmdline")

# Check if the split-cmdline output is non-empty
if [ -z "$CMD_OUTPUT" ]; then
  echo "Error: Failed to retrieve frontend invocation."
  exit 1
fi

# Get the first command (frontend invocation)
FIRST_CMD=$(echo "$CMD_OUTPUT" | head -n 1)

# Prefix the first command with lldb --
FINAL_CMD="lldb -- $FIRST_CMD"

# Print the final command for debugging
echo "Executing: $FINAL_CMD"

# Execute the final command
eval "$FINAL_CMD"

