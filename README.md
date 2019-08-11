# OverviewerDocker

Docker Images for handling minecraft overviewer


## Example

```bash
mkdir test-map && chmod  0777 test-map/ && chmod  o+t test-map/
docker run  -v $PWD/test-map:/WRK/test-map  --rm -ti testimage:latest ./rendertest.sh
```

Use own worldsave, remember to enable read access to the files.
Assume $WORLDSAVES is the path to the folder, containing your rendertest19 folder.

```bash
docker run  -v $WORLDSAVES/rendertest19:/WRK/rendertest19  \
  -v $PWD/test-map:/WRK/test-map  --rm -ti testimage:latest \
  ./rendertest.s
```

