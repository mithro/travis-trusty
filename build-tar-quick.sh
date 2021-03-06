#!/bin/sh

set -x
set -e

export TZ=UTC

DATE=$(date +%Y%m%d-%H%M%S)
LOG="${DATE}.log"

if [ ! -x docker-squash ]; then
  wget https://github.com/jwilder/docker-squash/releases/download/v0.1.0/docker-squash-linux-amd64-v0.1.0.tar.gz -O- | tar -zx
fi

(
  docker pull mithro/travis-trusty:latest
)

DOCKER_IMAGE_ID=mithro/travis-trusty:latest
DOCKER_TAG=mithro/travis-trusty:squashed-$DATE
docker save $DOCKER_IMAGE_ID | sudo ./docker-squash -from root -t $DOCKER_TAG | docker load

# Create a container as we can't export an image
docker run --cidfile="docker-squashed.$LOG" $DOCKER_TAG true

DOCKER_SQUASHED_ID=$(cat docker-squashed.$LOG)
TAR_FILE=ubuntu-trusty-$DATE-${DOCKER_SQUASHED_ID}.tar
docker export $DOCKER_SQUASHED_ID > $TAR_FILE
tar -tf $TAR_FILE > ${TAR_FILE}.list
bzip2 --best $TAR_FILE
