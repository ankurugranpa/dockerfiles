
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    SINGULARITY_VERSION=3.11.4 \
    GO_VERSION=1.21.6

RUN apt-get update && apt-get install -y \
    build-essential \
    uuid-dev \
    libgpgme-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config \
    wget \
    gnupg \
    zlib1g-dev \
    libglib2.0-dev \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

RUN wget https://github.com/sylabs/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-ce-${SINGULARITY_VERSION}.tar.gz && \
    tar -xzf singularity-ce-${SINGULARITY_VERSION}.tar.gz && \
    cd singularity-ce-${SINGULARITY_VERSION} && \
    ./mconfig && \
    make -C builddir && \
    make -C builddir install && \
    cd .. && rm -rf singularity-ce-${SINGULARITY_VERSION} singularity-ce-${SINGULARITY_VERSION}.tar.gz

# バージョン確認
RUN singularity version
