#!/bin/bash
PROXY="http://10.185.190.100:8080"
docker build --rm \
  --build-arg https_proxy="$PROXY" --build-arg http_proxy="$PROXY" \
  -t mc-overview-run -f run.Dockerfile .
