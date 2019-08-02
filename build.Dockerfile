FROM  ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y install git python3 python3-numpy python3-pil wget curl
RUN apt-get -y install build-essential python3-dev python-all-dev devscripts
RUN echo "hdunkel:x:501:100:Holger Dunkel:/home/hdunkel:/bin/bash" >> /etc/passwd

