FROM rust:1.70 as mpc-party-crossmusl

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local
RUN wget https://musl.cc/x86_64-linux-musl-cross.tgz && \
    tar xzf x86_64-linux-musl-cross.tgz && \
    rm x86_64-linux-musl-cross.tgz

ENV PATH="/usr/local/x86_64-linux-musl-cross/bin:${PATH}"
ENV CC_x86_64_unknown_linux_musl=x86_64-linux-musl-gcc
ENV TARGET_CC=x86_64-linux-musl-gcc
ENV TARGET_AR=x86_64-linux-musl-ar