FROM alpine:latest
MAINTAINER nickg
WORKDIR /tmp
RUN /bin/true \
  && apk update && apk upgrade \
  && apk add nodejs \
  && npm install -g markdownlint-cli@0.2.0 \
  && npm cache clean \
  && rm -rf /var/cache/apk/*
USER daemon
ENTRYPOINT [ "/usr/bin/markdownlint" ]
