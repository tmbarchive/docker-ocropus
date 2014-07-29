FROM ubuntu:14.04
MAINTAINER Tom <tmbdev@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -qq dist-upgrade
RUN apt-get -qqy install build-essential g++ gdb swig2.0 mercurial scons
RUN apt-get -qqy install curl python-scipy python-matplotlib python-tables firefox imagemagick python-opencv python-bs4
RUN apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

RUN hg clone https://code.google.com/p/ocropus
RUN (cd ocropus/ocropy && python setup.py download_models)
RUN (cd ocropus/ocropy && sudo python setup.py install)
ADD ocrotrain.sh /ocropus/ocropy/ocrotrain.sh
VOLUME /work
WORKDIR /work
