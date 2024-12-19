# syntax=docker/dockerfile:1
FROM alpine

ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM:-linux/amd64}

WORKDIR /realm

RUN apk add --no-cache wget && \
    case "${TARGETPLATFORM}" in \
    "linux/amd64") \
    URL="https://github.com/zhboner/realm/releases/download/v2.7.0/realm-x86_64-unknown-linux-musl.tar.gz" ;; \
    "linux/arm64") \
    URL="https://github.com/zhboner/realm/releases/download/v2.7.0/realm-aarch64-unknown-linux-musl.tar.gz" ;; \
    *) \
    echo "unsupported platform" && exit 1 ;; \
    esac && \
    wget -q -O realm.tar.gz "$URL" && \
    tar xzf realm.tar.gz && \
    rm -rf realm.tar.gz && \
    chmod +x /realm/realm

ENTRYPOINT ["/realm/realm"]