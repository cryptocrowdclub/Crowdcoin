#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-crowdcoinpay/crowdcoind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/crowdcoind docker/bin/
cp $BUILD_DIR/src/crowdcoin-cli docker/bin/
cp $BUILD_DIR/src/crowdcoin-tx docker/bin/
strip docker/bin/crowdcoind
strip docker/bin/crowdcoin-cli
strip docker/bin/crowdcoin-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
