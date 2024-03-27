FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache redis \
    && rm -rf /var/cache/apk/* 