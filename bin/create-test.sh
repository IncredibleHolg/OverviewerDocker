#!/bin/bash
set -e
source bin/values.sh

# get resourcepack
unzip -q ~/.minecraft/versions/$MCVERSION/$MCVERSION.jar \
  "assets/*" pack.mcmeta pack.png version.json -d resourcepack
tar -zcf resourcepack.tgz resourcepack
rm -rf resourcepack

cd Docker
mv ../resourcepack.tgz .
cp ../resources/* .
docker build --rm \
  --build-arg RELEASE -t mc-overview-test -f Testimage.Dockerfile .
rm -f *.tgz rendertest.py rendertest.sh
