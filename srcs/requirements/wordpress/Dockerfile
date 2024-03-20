FROM alpine:3.18.6

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	curl \
	mariadb-client \
	php81 \
	php81-fpm \
	php81-mysqli \
	php81-json \
	php81-openssl \
	php81-curl \
	php81-zlib \
	php81-xml \
	php81-phar \
	php81-intl \
	php81-dom \
	php81-xmlreader \
	php81-ctype \
	php81-session \
	php81-mbstring \
	php81-gd \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/bin/wp-cli.phar \
	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

