#!/bin/bash
source bin/values.sh
cd Docker
docker build --rm  \
  --build-arg https_proxy --build-arg http_proxy \
  -t mc-overview -f build.Dockerfile  .
