#!/bin/bash
docker build --rm -t \
  -e https_proxy -e http_proxy
  overviewer:build .
