FROM ubuntu:bionic

RUN add-apt-repository ppa:ubuntu-toolchain-r/test &&\
  apt-get update &&\
  apt-get install gcc-7 &&\
  apt-get install -y git

WORKDIR /opt
RUN wget https://www.ximea.com/downloads/recent/XIMEA_Linux_SP.tgz -O /opt/XIMEA_Linux_SP.tgz &&\
  tar xzf /opt/XIMEA_Linux_SP.tgz
WORKDIR /opt/package
RUN ./install
  


