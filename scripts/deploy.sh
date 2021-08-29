#!/bin/bash

deploy () {
  echo "Start Deploying...";

  docker push localhost:53456/rust-kube:latest
  kind load docker-image localhost:53456/rust-kube:latest --name local

  echo "Deploy finish...";
}

deploy