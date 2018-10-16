FROM debian:stretch
LABEL maintainer="Crowdcoin Developers <dev@crowdcoin.org>"
LABEL description="Dockerised CrowdcoinBrain, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
