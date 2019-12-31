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

Use the following command to create the image needed to run the source, if it is allready compilrd in a
mountable folder.

```bash
bash  create-docker-run.sh
```

The Image will be stored as ``mc-overview-run``

## Example

To start a build test imege, use:

```bash
bash create-test.sh
```

```bash
mkdir test-map && chmod  0777 test-map/ && chmod  o+t test-map/
docker run  -v $PWD/test-map:/WRK/test-map  --rm -ti mc-overview-test:latest ./rendertest.sh
```

Use own worldsave, remember to enable read access to the files.
Assume $WORLDSAVES is the path to the folder, containing your rendertest19 folder.

```bash
docker run  -v $WORLDSAVES/rendertest19:/WRK/rendertest19  \
  -v $PWD/test-map:/WRK/test-map  --rm -ti mc-overview-test:latest \
  ./rendertest.s
```

