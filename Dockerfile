# BUILD STAGE
FROM rust:1.41-stretch AS builder
WORKDIR /app
RUN apt-get update && apt-get -y install cmake musl-tools libssl-dev
RUN rustup target add x86_64-unknown-linux-musl

COPY src src
COPY Cargo.toml Cargo.lock ./
RUN cargo install --locked --target x86_64-unknown-linux-musl --path .

# SETUP STAGE
FROM alpine:3.10

WORKDIR /app
COPY --from=builder /usr/local/cargo/bin/rust-kube .

RUN test -d /app/env/cloud-logging && echo "vault directory exists" || mkdir /app/env/cloud-logging

EXPOSE 8000
ENTRYPOINT ["./rust-kube"]