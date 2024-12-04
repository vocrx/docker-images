# syntax=docker/dockerfile:1

FROM alpine

COPY entrypoint.sh /root/ss-rust/

WORKDIR /root/ss-rust

ARG TARGETPLATFORM

RUN apk add --no-cache wget tar xz tini && \
    if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
    URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.21.2/shadowsocks-v1.21.2.aarch64-unknown-linux-musl.tar.xz"; \
    elif [ "${TARGETPLATFORM}" = "linux/amd64" ]; then \
    URL="https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.21.2/shadowsocks-v1.21.2.x86_64-unknown-linux-musl.tar.xz"; \
    fi && \
    wget -q $URL -O ss-rust.tar.xz && \
    tar -xvf ss-rust.tar.xz && \
    chmod +x entrypoint.sh && \
    rm -f ss-rust.tar.xz sslocal ssmanager ssservice ssurl && \
    apk del wget tar xz

ENTRYPOINT ["/sbin/tini", "--", "/root/ss-rust/entrypoint.sh"]
