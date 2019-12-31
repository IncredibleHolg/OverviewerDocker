# OverviewerDocker

Docker Images for handling minecraft overviewer

## Building

### Build image

Use the following command to create the image needed to compile the GIT source.

```bash
bash create-buildimage.sh 
```

The Image will be stored as ``mc-overview``

### Execude image

Use the following command to create the image needed to run the source, if it is allready compiled in a
mountable folder.

```bash
bash  create-docker-run.sh
```

The Image will be stored as ``mc-overview-run``

## Example

To start a build test image, use:

```bash
bash create-test.sh
```

```bash
mkdir test-map && chmod  0777 test-map/ && chmod  o+t test-map/
docker run  -v $PWD/test-map:/WRK/test-map  --rm -ti mc-overview-test:latest ./rendertest.sh
```

Use your own worldsave, remember to enable read access to the files.
Assume $WORLDSAVES is the path to the folder, containing your rendertest19 folder.

```bash
docker run  -v $WORLDSAVES/rendertest19:/WRK/rendertest19  \
  -v $PWD/test-map:/WRK/test-map  --rm -ti mc-overview-test:latest \
  ./rendertest.sh
```

The script ``rendertest.sh`` only starts the overviewer with matching parameters.

```bash
#!/bin/bash
OVDIR=/MOV
branch=master
OVERVIEWER=${OVDIR}/overviewer.py
python3  $OVERVIEWER  -c rendertest.py 
```

## Other Ubuntu releases

* to use another  Ubuntu release, use e.g ``export RELEASE=18.04``

Then rebuild the Images:

```bash
bash create-buildimage.sh
bash create-docker-run.sh
bash create-test.sh
```
