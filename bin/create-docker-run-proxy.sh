#!/bin/bash
source values.sh
cd Docker
docker build --rm \
  --build-arg https_proxy="$PROXY" --build-arg http_proxy="$PROXY" \
  -t mc-overview-run -f run.Dockerfile .
