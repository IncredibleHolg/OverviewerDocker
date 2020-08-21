#!/bin/bash
OVDIR=/MOV
branch=master
#branch=implement-new-stairs
OVERVIEWER=${OVDIR}/overviewer.py
python3  $OVERVIEWER  -c rendertest.py 
