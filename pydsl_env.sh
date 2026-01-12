
# PyDSL development environment
# Activates venv and sets MLIR/LLVM paths

source /Users/jan/dev/PyDSL/.venv/bin/activate

export PYDSL_LLVM="/Users/jan/dev/PyDSL/llvm-project/build"

export PYTHONPATH="/Users/jan/dev/PyDSL/llvm-project/build/tools/mlir/python_packages/mlir_core${PYTHONPATH:+:$PYTHONPATH}"

export PATH="/Users/jan/dev/PyDSL/llvm-project/build/bin:/opt/homebrew/opt/llvm@19/bin:$PATH"
hash -r

export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

