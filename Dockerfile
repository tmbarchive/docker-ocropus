FROM ubuntu:14.04
MAINTAINER Konstantin Baierer <konstantin.baierer@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
# ENV MODEL_REPOSITORY http://www.tmbdev.net/ocropy/
ENV MODEL_REPOSITORY http://www-test.bib.uni-mannheim.de/infolis/ocropy

RUN apt-get update && \
  apt-get -y install --no-install-recommends git ca-certificates curl && \
  git clone --depth 1 'https://github.com/tmbdev/ocropy.git' && \
  cd ocropy &&\
    apt-get install -y $(cat PACKAGES) && \
    (cd models && http_proxy="" curl -O $MODEL_REPOSITORY/en-default.pyrnn.gz) && \
    (cd models && http_proxy="" curl -O $MODEL_REPOSITORY/fraktur.pyrnn.gz) && \
    python setup.py install && \
  apt-get -y remove --purge --auto-remove git curl && \
  apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* .git
ADD ocrotrain.sh ocropy/ocrotrain.sh
VOLUME /work
WORKDIR /work
