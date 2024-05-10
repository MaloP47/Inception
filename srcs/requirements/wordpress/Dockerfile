# FROM alpine:3.18.6

# ARG WP_USER=wp-data

# RUN apk update \
#     && apk upgrade \
#     && apk add --no-cache \
#     curl \
#     mariadb-client \
#     php81 php81-fpm php81-mysqli php81-json php81-openssl php81-curl \
#     php81-zlib php81-xml php81-phar php81-intl php81-dom php81-mbstring \
#     php81-opcache php81-gd php81-redis \
#     && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/bin/wp \
#     && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* \
#     && addgroup -S ${WP_USER} -g 1000 \
#     && adduser -S -G ${WP_USER} ${WP_USER} \
#     && mkdir -p /var/www/wp \
#     && chown -R ${WP_USER}:${WP_USER} /etc/php81 \
#     && chmod -R 755 /etc/php81

# COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
# COPY ./tools/init_wp.sh /var/www/wp

# WORKDIR /var/www/wp

# RUN chmod +x init_wp.sh \
#     && chown ${WP_USER}:${WP_USER} init_wp.sh \
# 	&& wp core download --version=6.4.3 --path=/var/www/wp \
#     && chown -R ${WP_USER}:${WP_USER} /var/www/wp \
#     && chmod -R +x /var/www/wp \
# 	&& chown -R ${WP_USER}:${WP_USER} /usr/bin 

# USER ${WP_USER}:${WP_USER}

# ENTRYPOINT ["./init_wp.sh"]

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

# copying init_wp.sh in the docker for entrypoint
COPY tools/init_wp.sh /scripts/
RUN chmod +x /scripts/init_wp.sh

# copying www.conf in conveniant folder for php-fpm
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

# container entrypoint
ENTRYPOINT ["/scripts/init_wp.sh"]

