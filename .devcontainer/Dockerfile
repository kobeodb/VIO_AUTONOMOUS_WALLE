FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        clang-format-18 \
        ninja-build \
        python3 \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/ruff \
    && /opt/ruff/bin/pip install --no-cache-dir ruff==0.16.3

    ENV PATH="/opt/ruff/bin:${PATH}"

USER vscode
WORKDIR /workspace

CMD ["/bin/bash"]
