#!/usr/bin/env bash

docker run \
  -it \
  -h dev \
  --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/Code:/root/code \
  -v $HOME/.ssh:/root/.ssh \
  --privileged \
  --name dev \
  max/workstation
