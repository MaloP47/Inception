# penultimate alpine version (https://alpinelinux.org/cloud/)
FROM alpine:3.18.6

# update and upgrade
RUN apk update && apk upgrade
# installing utilities, php 8.1 and mariadb client
RUN apk add bash curl less git vim \
	php81-fpm php81-json php81-zlib php81-xml php81-xmlwriter \
	php81-pdo php81-phar php81-openssl php81-pdo_mysql \
	php81-mysqli php81-session php81-gd php81-iconv php81-gmp \
	php81-zip php81-curl php81-opcache php81-ctype php81-apcu \
	php81-intl php81-bcmath php81-dom php81-mbstring php81-xmlreader \
	mariadb-client musl

# downloading wordpress cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli

# copying wordpress_init.sh in the docker for entrypoint
COPY tools/wordpress_init.sh /scripts/
RUN chmod +x /scripts/wordpress_init.sh

# copying www.conf in conveniant folder for php-fpm
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

# container entrypoint
ENTRYPOINT ["/scripts/wordpress_init.sh"]

