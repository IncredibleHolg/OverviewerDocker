#!/bin/bash
# script called inside a python container
#
# checkout the repository, only master branch
set -x
git clone --depth 1 https://github.com/overviewer/Minecraft-Overviewer.git -b master
cd Minecraft-Overviewer/
curl -O  https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/Imaging.h
curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImagingUtils.h
curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImPlatform.h
# load python modules
pip install -q pillow
pip install -q numpy
pip install -q networkx
# run the build
python3 setup.py build
