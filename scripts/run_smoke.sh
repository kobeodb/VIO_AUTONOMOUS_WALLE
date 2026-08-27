#!/usr/bin/env bash

set -euo pipefail

BUILD_DIR="${BUILD_DIR:-/tmp/vio-build}"

export RUFF_CACHE_DIR="${RUFF_CACHE_DIR:-/tmp/ruff-cache}"
export PYTHONDONTWRITEBYTECODE=1

echo "Checking C++ formatting..."
find cpp tests/cpp \
    -type f \
    \( -name "*.cpp" -o -name "*.hpp" -o -name "*.cc" -o -name "*.h" \) \
    -print0 \
    | xargs -0 -r clang-format-18 --dry-run --Werror

echo "Checking python linting..."
ruff check python tests/python

echo "Checking python formatting..."
ruff format --check python tests/python

echo "Configuring C++ project..."
cmake -S . -B "$BUILD_DIR" -G Ninja -DCMAKE_BUILD_TYPE=Debug

echo "Building C++ targets..."
cmake --build "$BUILD_DIR"

echo "Running C++ tests..."
ctest --test-dir "$BUILD_DIR" --output-on-failure

echo "Running C++ executable..."
"$BUILD_DIR/cpp/vio_smoke"

echo "Running Python tests..."
PYTHONPATH=python python3 -m unittest discover \
    -s tests/python \
    -v

echo "Running Python package..."
PYTHONPATH=python python3 -m vio_tools

echo "Smoke test completed successfully."
