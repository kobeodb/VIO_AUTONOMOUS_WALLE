FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ninja-build \
        python3 \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /workspace

CMD ["/bin/bash"]
