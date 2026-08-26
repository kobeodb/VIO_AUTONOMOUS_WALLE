#!/usr/bin/env bash

set -euo pipefail

CPP_FILES=(
    cpp/include/vio/project.hpp
    cpp/src/project.cpp
    cpp/apps/vio_smoke.cpp
    tests/cpp/test_project.cpp
)

echo "Checking C++ formatting..."
clang-format-18 --dry-run --Werror "${CPP_FILES[@]}"

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
