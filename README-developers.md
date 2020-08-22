# OverviewerDocker - developer information

This project generates Docker images intended to provide a working environment
for the [Minecraft-Overviewer project](https://github.com/overviewer/Minecraft-Overviewer)

## Images

The Images are based on Ubuntu base images.
The default is ``20.04`` to select another base image, export the variable ```RELEASE```

* Tested Versions:
  * 18.04
  * 20.04

## Prerequisites

The ``mc-overview`` and ``mc-overview-run`` do not have any prerequisites. The use only Ubuntu packages.

The image ``mc-overview-test`` contains the [Minecraft-Overviewer project](https://github.com/overviewer/Minecraft-Overviewer) data and minecraft specific data.

To render the world, a resourcepack is needed. This can be extracted from the ``minecraft.jar`` file or added
directly. **This resourcepack is not part of this project**.

The testworld ``testworld.tgz`` is stored using LFS, to get this downloaded, setup git to use ``LFS``.
See [Git Large File Storage](https://git-lfs.github.com/) on how to do this.

The ``create-test.sh`` script tries to locate a resourcepack on the system it is running on.

* If an archive ``resources/resourcepack.tgz`` is found, this one is used.
* If no resourcepack is found this is the strategy to get the deeded data.
* The versions and pathes are defined (and changable) in  ``values.sh``
  * The minecraft version is defined as ``MCVERSION`` **default** ``1.16.2``
  * ``MCHOME`` is the Minecraft configuration folder **default** ``$HOME/.minecraft``
* The script tries to extract the resourcepack from \$MCHOME/versions/\$MCVERSION/\$MCVERSION.jar
* The resourcepack is then archived as ``resourcepack.tgz``, containing a toplevel folder ``resourcepack``

A simple testworld is included, you may replace ``resources/testworld.tgz`` with an archive of your own testworld. This archive contains a toplevel folder testworld, which contains the Minecraft saves data.

### Build images

The images are buld by the scripts

* build-all.sh: execute all the following scripts
* create-buildimage.sh: create the image containing the full compile environment
* create-docker-run.sh: create the image containing the runtime environment
* create-test.sh: create a runtime environment, containing the Minecraft-Overviewer software, a resource pack and  a testworld.

### Examples

* Configure a clean compile environment to work on the Minecraft-Overviewer sources
  * clone the Minecraft-Overviewer and switch to the work environment
  * start a compile container mapping this folder into the container
  * be sure to use your UID to avoid permission problems

```bash
git clone https://github.com/overviewer/Minecraft-Overviewer.git
cd Minecraft-Overviewer
curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/Imaging.h;\
curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImagingUtils.h ;\
curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImPlatform.h
docker run --rm -v /etc/passwd:/etc/passwd  -u $user -v $PWD:/MOV mc-overview:20.04
 python3 setup.py build && python3 overviewer.py --verbose --version
```

The last command is executed inside the container and compiles the Minecraft-Overviewer software.

* For later use of the environment, simply map your workfilder into the container
* For example, update the software to the latest master

```bash
docker run --rm -v /etc/passwd:/etc/passwd  -u $user -v $PWD:/MOV mc-overview:20.04
git checkout master
git pull
python3 setup.py build

```
