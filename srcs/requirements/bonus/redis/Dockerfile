FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add redis \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

COPY ./conf/redis.conf /etc/redis.conf
