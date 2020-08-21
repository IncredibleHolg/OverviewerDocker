#!/bin/bash
# create all Docker images
bin/create-buildimage.sh
bin/create-docker-run.sh
bin/create-test.sh
