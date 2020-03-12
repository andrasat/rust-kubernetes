#!/bin/bash

run_build () {
  echo "Start Build !!";

  rm -rf target/
  docker build -t rust-kube .

  echo "Build finish !";
}

run_build