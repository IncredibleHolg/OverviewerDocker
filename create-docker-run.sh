#!/bin/bash
source values.sh
docker build --rm \
  -t mc-overview-run:${RELEASE} \
  --build-arg RELEASE -f run.Dockerfile .
docker tag mc-overview-run:${RELEASE}  docker.io/incredibleholg/mc-overview-run:${RELEASE}
