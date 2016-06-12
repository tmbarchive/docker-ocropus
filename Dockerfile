FROM ubuntu:14.04
MAINTAINER Tom <tmbdev@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get -y install build-essential g++ gdb swig2.0 mercurial curl git scons && \
    apt-get -y install python-scipy python-matplotlib python-tables firefox imagemagick python-opencv python-bs4 && \
    apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* && \
    git clone --depth 1 https://github.com/tmbdev/ocropy.git && \
    (cd ocropy/models && curl -O http://www.tmbdev.net/en-default.pyrnn.gz) && \
    (cd ocropy/models && curl -O http://www.tmbdev.net/ocropy/fraktur.pyrnn.gz) && \
    (cd ocropy && sudo python setup.py install)
ADD ocrotrain.sh ocropy/ocrotrain.sh
VOLUME /work
WORKDIR /work
