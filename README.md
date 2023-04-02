# Rust in Kubernetes

This is my attempt to learn how I can deploy Rust in Kubernetes. It's just a simple hello world application, deployed into Kind locally. I also build the docker image into local registry.

## Prerequisites

- [Docker](https://www.docker.com/)
- [Kind](https://kind.sigs.k8s.io/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Rust](https://www.rust-lang.org/tools/install)

## Configured Scripts

```bash
# Build the docker image
$ ./scripts/build.sh
```

```bash
# Deploy docker image application to Kind
$ ./scripts/deploy.sh
```
