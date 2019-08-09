ARG COMPILEIMAGE=docker.io/incredibleholg/mc-overview
ARG RUNIMAGE=docker.io/incredibleholg/mc-overview-run

FROM ${COMPILEIMAGE}  AS compiler

RUN echo "overviewer:x:10001:overviewer" >> /etc/group &&\
     echo "overviewer:x:10001:10001:Holger Dunkel:/home/hdunkel:/bin/bash" >> /etc/passwd
RUN  git clone --single-branch --branch master \
         https://github.com/overviewer/Minecraft-Overviewer.git  MOV
RUN cd MOV &&\
    ls -l &&\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/Imaging.h;\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImagingUtils.h ;\
    curl -O https://raw.githubusercontent.com/python-pillow/Pillow/master/src/libImaging/ImPlatform.h
RUN cd MOV && python3 setup.py build &&\
     python3 overviewer.py --verbose --version

FROM ${RUNIMAGE}  AS run
COPY --from=compiler /etc/passwd /etc/passwd
COPY --from=compiler /etc/group /etc/group
COPY --chown=overviewer:overviewer --from=compiler /MOV /MOV
ENV PATH=/MOV:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir /WRK && chown overviewer /WRK
COPY --chown=overviewer:overviewer rendertest19.tgz resourcepack.tgz /WRK/
USER overviewer
WORKDIR /WRK
