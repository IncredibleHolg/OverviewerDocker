ARG BASEIMAGE=docker.io/ubuntu:19.10
FROM  ${BASEIMAGE}

RUN apt-get -y update
RUN apt-get -y install git wget curl 
RUN apt-get -y install python3 python3-pil python3-numpy
