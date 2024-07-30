ARG BUILD_FROM=ghcr.io/hassio-addons/base/arm64
FROM $BUILD_FROM

WORKDIR /opt

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
  apk --no-cache add \
    nginx \
  \
  && mkdir -p /run/nginx

RUN apk add openjdk21
RUN apk add postgresql-client
RUN rm -fr /tmp/*
RUN rm -fr /etc/nginx

COPY rootfs /