# VIO Autonomous WALL-E

[![CI](https://github.com/kobeodb/VIO_AUTONOMOUS_WALLE/actions/workflows/ci.yml/badge.svg)](https://github.com/kobeodb/VIO_AUTONOMOUS_WALLE/actions/workflows/ci.yml)

A dataset-first project for learning, implementing, and evaluating visual-inertial odometry, followed by deployment on a preserved Thinkway Ultimate WALL-E platform.

## Project goal

Build an uncertainty-aware visual-inertial odometry pipeline from mathematical foundations, validate it on public datasets, and eventually use it as part of a safe, supervised autonomous WALL-E system.

The project prioritizes:

- Explicit coordinate frames, units, and timestamps
- Deterministic tests and experiments
- Reproducible C++ and Python tooling
- Quantitative evaluation rather than demonstration alone
- Reversible and safety-conscious hardware changes

## Current status

**Phase 0 — Project setup and baseline discipline**

Currently implemented:

- Ubuntu 24.04 Docker development environment
- Minimal C++17 library and executable
- Minimal Python package
- C++ tests through CTest
- Python tests through `unittest`
- C++ formatting through clang-format
- Python linting and formatting through Ruff
- GitHub Actions continuous integration

The current executable is a project smoke test, not yet a VIO implementation.

## Requirements

Only the following host tools are required:

- Git
- Docker with Docker Compose v2

All compilers, Python tools, formatters, and test dependencies run inside the Docker environment.

The reference runtime is Ubuntu 24.04. Native macOS builds are not currently supported.

## Quick start

Clone the repository:

```bash
git clone https://github.com/kobeodb/VIO_AUTONOMOUS_WALLE.git
cd VIO_AUTONOMOUS_WALLE
```

Build the development image:

```bash
docker compose build
```

Run every formatting check, build, and test:

```bash
docker compose run --rm dev ./scripts/run_smoke.sh
```

A successful run ends with:

```text
Smoke test completed successfully.
```

No manual dependency installation or source-file modification should be necessary.

## What the smoke test checks

The smoke test performs the following operations:

1. Checks C++ formatting.
2. Checks Python linting.
3. Checks Python formatting.
4. Configures the C++ project with CMake.
5. Builds the C++ targets with Ninja.
6. Runs all CTest tests.
7. Runs the C++ smoke executable.
8. Discovers and runs the Python tests.
9. Runs the Python package.

The same command runs locally and in GitHub Actions.

## Repository structure

```text
.
├── cpp/
│   ├── include/vio/       C++ public headers
│   ├── src/               C++ library implementations
│   └── apps/              C++ executables
├── python/vio_tools/      Python package
├── tests/
│   ├── cpp/               C++ tests
│   └── python/            Python tests
├── scripts/               Reproducible project commands
├── configs/               Future experiment configurations
├── experiments/           Future experiment manifests and results
├── docs/                  Environment and architecture documentation
├── hardware/              Future WALL-E audit and hardware records
├── .github/workflows/     Continuous-integration workflows
├── CMakeLists.txt         Top-level C++ build configuration
├── pyproject.toml         Python package and Ruff configuration
├── compose.yaml           Development-container interface
└── .devcontainer/         Ubuntu development image
```

## Development workflow

Create a small, focused change and add or update its tests.

Before committing, run:

```bash
docker compose run --rm dev ./scripts/run_smoke.sh
```

Push only when the smoke test passes. GitHub Actions will repeat the same checks on a fresh Ubuntu runner.

## Data policy

Downloaded datasets, ROS bags, build products, caches, and machine-specific files must not be committed.

Public datasets such as EuRoC and TUM-VI will be downloaded separately and referenced through configuration files.

Small synthetic fixtures required by automated tests may be committed under `tests/`.

## Development environment

Exact tool versions and architecture information are recorded in [`docs/environment.md`](docs/environment.md).

The current ROS 2 target is Jazzy, but ROS integration has not started yet.

## Next milestone

Phase 1 introduces:

- Coordinate frames
- Rotation matrices
- Quaternions
- Rigid transforms
- Numerical verification of rotation and transform operations

## Hardware status

The WALL-E hardware track has not started.

