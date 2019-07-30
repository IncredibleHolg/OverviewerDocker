#!/bin/bash
docker build --rm  \
  --build-arg https_proxy --build-arg http_proxy \
  -t overviewer:build .
