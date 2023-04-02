#!/bin/bash

build () {
  echo "Start Build !!";

  docker build . -t localhost:53456/rust-kube:latest

  echo "Build finish !";
}

build