FROM python:3-alpine

MAINTAINER Joe Black <joeblack949@gmail.com>

ENV     TMPLD_VERSION 0.2.0

LABEL   lang.python.version=3
LABEL   app.name=kubewait
LABEL   app.version=${KUBEWAIT_VERSION}

ADD     https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /dumb-init
RUN     chmod +x /dumb-init

RUN     pip3 install tmpld

ENV     TMPLD_ENVIRONMENT production
ENV     TMPLD_LOG_LEVEL INFO
ENV     TMPLD_NAMESPACE default
ENV     TMPLD_DOMAIN cluster.local
ENV     TMPLD_EXTENSIONS=kube,caps

ENTRYPOINT  ["/dumb-init", "--", "tmpld"]
