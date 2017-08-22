FROM    joeblackwaslike/debian:stretch

MAINTAINER Joe Black <me@joeblack.nyc>

ADD     https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /dumb-init
RUN     chmod +x /dumb-init

LABEL   lang.python.version=3
LABEL   app.name=tmpld

# python3-lxml
RUN     apt-get update && \
            apt-get install -yqq python3 python3-pip && \
            apt-clean --aggressive && \
        pip3 install --upgrade pip requests setuptools


ARG     TMPLD_VERSION
ENV     TMPLD_VERSION=${TMPLD_VERSION:-0.2.4}
LABEL   app.version=${TMPLD_VERSION}

RUN     pip3 install tmpld==$TMPLD_VERSION

ENV     TMPLD_ENVIRONMENT production
ENV     TMPLD_LOG_LEVEL INFO
ENV     KUBE_NAMESPACE default
ENV     KUBE_DOMAIN cluster.local

ENTRYPOINT  ["/dumb-init", "--", "tmpld"]
