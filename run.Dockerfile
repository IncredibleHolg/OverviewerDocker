ARG BASEIMAGE=ubuntu:18.04
FROM  ${BASEIMAGE}

RUN apt-get -y update
RUN apt-get -y install git wget curl 
RUN apt-get -y install python3 python3-pil python3-numpy
RUN echo "hdunkel:x:501:100:Holger Dunkel:/home/hdunkel:/bin/bash" >> /etc/passwd
