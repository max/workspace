#!/usr/bin/env bash

docker run \
  -it \
  -h dev \
  --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/.ssh:/root/.ssh \
  -v $HOME/.config:/root/.config \
  -v $HOME/Code:/root/code \
  --privileged \
  --name dev \
  max/workstation
