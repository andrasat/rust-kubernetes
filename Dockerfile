# BUILD STAGE
FROM rust:1.54-slim AS builder
WORKDIR /app
RUN apt-get update && apt-get -y install cmake musl-tools libssl-dev
RUN rustup target add x86_64-unknown-linux-musl

COPY src src
COPY Cargo.toml Cargo.lock ./
RUN cargo install --locked --target x86_64-unknown-linux-musl --path .

# SETUP STAGE
FROM alpine:3.14

WORKDIR /app
COPY --from=builder /usr/local/cargo/bin/rust-kube .

EXPOSE 8000
ENTRYPOINT ["./rust-kube"]