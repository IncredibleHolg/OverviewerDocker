#!/bin/bash
set -e
source bin/values.sh

# get resourcepack
( cd resources
  if [ -r resourcepack.tgz  ]; then
    echo "Found a resourcepack.tgz file, using this one"
  else
    echo "Try to extract the resourcepack"
    unzip -q $MCHOME/versions/$MCVERSION/$MCVERSION.jar \
    "assets/*" pack.mcmeta pack.png version.json -d resourcepack
    tar -zcf resourcepack.tgz resourcepack
    rm -rf resourcepack
  fi
)
cd Docker
cp ../resources/* .
docker build --rm \
  --build-arg RELEASE --build-arg BRANCH -t mc-overview-test -f Testimage.Dockerfile .
rm -f *.tgz rendertest.py rendertest.sh
