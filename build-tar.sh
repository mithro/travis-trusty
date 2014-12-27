#!/bin/sh

set -x
set -e

if [ ! -x docker-squash ]; then
  wget https://github.com/jwilder/docker-squash/releases/download/v0.0.11/docker-squash-linux-amd64-v0.0.11.tar.gz -O- | tar -zx
fi

(
  cd docker-base
  docker build . | tee ../docker-build.log
)

DOCKER_IMAGE_ID=$(grep "Successfully built" docker-build.log | sed -e's/Successfully built //')
docker save $DOCKER_IMAGE_ID | sudo ./docker-squash -from root -t squashed | docker load

# Create a container as we can't export an image
docker run --cidfile="docker-squashed.log" squashed:latest true

DOCKER_SQUASHED_ID=$(cat docker-squashed.log)
TAR_FILE=ubuntu-trusty-${DOCKER_SQUASHED_ID}.tar
docker export $DOCKER_SQUASHED_ID > $TAR_FILE
tar -tf $TAR_FILE ${TAR_FILE}.list
bzip2 --best $TAR_FILE
