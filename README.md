# OverviewerDocker

This project generates Docker images intended to provide a working environment
for the [Minecraft-Overviewer project](https://github.com/overviewer/Minecraft-Overviewer)

Here are some examples, where this may be usefull.

* Test building the project on a clean environment (you may have incompatible Python modules installed)
* Build on differen Linux distributions (The images are build on Ubuntu).
* Have different, compiled versions of ``Minecraft-Overviewer`` available.

## Images

After [building the images](#building-the-images),  three different images are available.

### mc-overview-test

This image contains The python runtime environment, a compiled ``master`` branch of ``Minecraft-Overviewer``
and all components to start rendering by starting ``rendertest.sh``. Check [README-developers.md](README-developers.md) for the prerequisites to build and customize this image.

### mc-overview

This Image contains all the tools to build a functional ``Minecraft-Overviewer`` environment,
including all the needed compiler components.

### mc-overview-run

This Image contains only the needed Python components. If you have a working directory with a
compiled  ``Minecraft-Overviewer`` environment, you can use this container for the map generation.
Use the Docker option ``` -v $LOCALDIR:/MOV``` to map your working directory into the docker container.
Check [README-developers.md] on how to use this image.

### Building the images

Check the prerequisites in [README-developers.md](README-developers.md). You will need a recent texturepack
and probably a Minecraft testworld to render.

Use the following command to create all the needed images (this will fail, unless the prerequisites are met).

```bash
bash bin/build-all.sh
```

The testing image will be generated as ``mc-overview-test``

### Run the test image

Use this command, to render the testworld, included in the ``mc-overview-test`` image, using
the selected ``Minecraft-Overviewer`` branch.

```bash
docker run  -ti --rm mc-overview-test ./rendertest.sh
```

The map will be placed inside the container and deleted together with the container after the execution is finished. To keep your map, use the docker volume mappping to place a local folder into your environment.

```bash
mkdir test-map
chmod 0777 test-map
docker run  -ti --rm -v $PWD/test-map:/WRK/test-map mc-overview-test ./rendertest.sh
```

The processes inside the container are execudet as ``overviewer`` with ``UID=10001``.
To get proper access rights, the test-map folder is set to ```0777```.

### Other uses

The other to images are tools for experiment and testing. Usage examples  can be found in the
[README-developers.md](README-developers.md) document.
