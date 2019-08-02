#!/bin/bash
OVDIR=../IncH_Minecraft-Overviewer 
#branch=new-slabs-1.14
# branch=master
#branch=workstations
branch=add-lantern
#OVDIR=../Minecraft-Overviewer
OVERVIEWER=${OVDIR}/overviewer.py
( cd $OVDIR/ && git checkout $branch  && python3 setup.py build )|| exit 1
#( cd $OVDIR/ &&  python2 setup.py build )|| exit 1
# start rendering
python3  $OVERVIEWER  -c rendertest.py 
