ARG BASEIMAGE=mc-overview
FROM ${BASEIMAGE}

RUN  git clone --single-branch --branch master \
         https://github.com/overviewer/Minecraft-Overviewer.git  MOV
RUN cd MOV &&\
    ls -l &&\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/Imaging.h;\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImagingUtils.h ;\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImPlatform.h
RUN cd MOV && python3 setup.py build &&\
     python3 overviewer.py --verbose --version
WORKDIR /MOV