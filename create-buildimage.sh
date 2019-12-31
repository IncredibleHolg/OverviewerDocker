#!/bin/bash
source values.sh
docker build --rm  \
  -t mc-overview:${RELEASE} \
  --build-arg RELEASE -f build.Dockerfile  .
docker tag mc-overview:${RELEASE}  docker.io/incredibleholg/mc-overview:${RELEASE}
