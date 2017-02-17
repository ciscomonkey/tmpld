FROM callforamerica/debian

MAINTAINER Joe Black <joeblack949@gmail.com>

ADD     https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /dumb-init
RUN     chmod +x /dumb-init

ENV     TMPLD_VERSION 0.2.3

LABEL   lang.python.version=3
LABEL   app.name=kubewait
LABEL   app.version=${TMPLD_VERSION}

# python3-lxml
RUN     apt-get update && \
            apt-get install -yqq python3 python3-pip && \
            apt-clean --aggressive

RUN     pip3 install tmpld[caps]==$TMPLD_VERSION

ENV     TMPLD_ENVIRONMENT production
ENV     TMPLD_LOG_LEVEL INFO
ENV     TMPLD_EXTENSIONS kube,caps
ENV     KUBE_NAMESPACE default
ENV     KUBE_DOMAIN cluster.local

ENTRYPOINT  ["/dumb-init", "--", "tmpld"]
