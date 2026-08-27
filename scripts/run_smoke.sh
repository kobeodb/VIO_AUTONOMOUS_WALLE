#!/usr/bin/env bash

set -euo pipefail

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
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug

echo "Building C++ targets..."
cmake --build build

echo "Running C++ tests..."
ctest --test-dir build --output-on-failure

echo "Running C++ executable..."
./build/cpp/vio_smoke

echo "Running Python tests..."
PYTHONPATH=python python3 -m unittest discover \
    -s tests/python \
    -v

echo "Running Python package..."
PYTHONPATH=python python3 -m vio_tools

echo "Smoke test completed successfully."
