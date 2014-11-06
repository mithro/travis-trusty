#!/bin/sh

wget https://github.com/jwilder/docker-squash/releases/download/v0.0.11/docker-squash-linux-amd64-v0.0.11.tar.gz -O- | tar -zx

(
  cd docker
  docker build . | tee docker-build.log
)

#docker save <image_id> | sudo docker-squash -from root -t newtag | docker load
#docker export e23fe20e4220 > ubuntu-trusty.tar
#bzip2 ubuntu-trusty.tar

