FROM ubuntu:16.04
MAINTAINER Konstantin Baierer <konstantin.baierer@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHONIOENCODING utf8

ADD ocropy /ocropy
ADD ocr-models-client /ocr-models-client
WORKDIR /work
ADD ocrotrain.sh /ocropy/ocrotrain.sh
RUN apt-get update && \
    apt-get -y install --no-install-recommends git ca-certificates wget unzip && \
    cd /ocropy && \
        /ocr-models-client/ocr-models download -d models 'ocropy/en-default' 'ocropy/fraktur' && \
        apt-get install -y $(cat PACKAGES) && \
        python setup.py install && \
        apt-get -y remove --purge --auto-remove git wget unzip && \
        apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* .git
VOLUME /work
