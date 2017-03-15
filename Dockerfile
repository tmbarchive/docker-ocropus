FROM ubuntu:16.04
MAINTAINER Konstantin Baierer <konstantin.baierer@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONIOENCODING utf8

RUN apt-get update && \
    apt-get -y install --no-install-recommends git ca-certificates wget unzip && \
    git clone --depth 1 'https://github.com/kba/ocr-models-client' /ocr-models-client && \
    git clone --depth 1 'https://github.com/tmbdev/ocropy.git' /ocropy && \
    cd /ocropy && \
        /ocr-models-client/ocr-models download -d models 'ocropy/en-default' 'ocropy/fraktur' && \
        sed -i -e 's/firefox//' -e 's/python-opencv//' PACKAGES && \
        apt-get install -y $(cat PACKAGES) && \
        python setup.py install && \
        apt-get -y remove --purge --auto-remove git wget unzip && \
        apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* .git
ADD ocrotrain.sh ocropy/ocrotrain.sh
VOLUME /work
WORKDIR /work
