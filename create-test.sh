#!/bin/bash
source values.sh
docker build --rm \
  --build-arg RELEASE -t mc-overview-test -f Testimage.Dockerfile .
