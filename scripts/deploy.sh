#!/bin/bash

deploy () {
  echo "Start Deploying...";

  docker push localhost:53456/rust-kube:latest
  kind load docker-image localhost:53456/rust-kube:latest --name local

  kubectl apply -f config/kubernetes/deployment.yaml
  kubectl apply -f config/kubernetes/service.yaml

  echo "Deploy finish...";
}

deploy