# FROM alpine:3.18.6

# ARG WP_USER=test

# RUN apk update \
# 	&& apk upgrade \
# 	&& apk add --no-cache \
# 	curl \
# 	mariadb-client \
# 	php81 php81-fpm php81-mysqli php81-json php81-openssl php81-curl \
# 	php81-zlib php81-xml php81-phar php81-intl php81-dom php81-mbstring \
# 	php81-opcache php81-gd php81-redis \
# 	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	&& chmod +x wp-cli.phar \
# 	&& mv wp-cli.phar /usr/bin/wp\
# 	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*l \
# 	&& delgroup ${WP_USER} && addgroup -S -g 1000 ${WP_USER} && adduser -S ${WP_USER} -G ${WP_USER} \
# 	&& mkdir -p /var/www/wp \
# 	&& chown -R ${WP_USER}:${WP_USER} /usr/local/bin/wp \
# 	&& chmod +x /usr/local/bin/wp 

# COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
# COPY ./tools/init_wp.sh /var/www/wp

# WORKDIR /var/www/wp

# RUN chown ${WP_USER}:${WP_USER} /var/www/wp/init_wp.sh \
# 	&& chmod +x /var/www/wp/init.sh \
# 	&& chown ${WP_USER}:${WP_USER} /var/www/wp/init.sh && \
#     && chmod +x /var/www/wp/init.sh && 

# USER ${WP_USER}:${WP_USER}


# ENTRYPOINT ["./init_wp.sh"]

# FROM alpine:3.18.6

# ARG WP_USER=test

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
#     && chown -R ${WP_USER}:${WP_USER} /var/www/wp

# COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
# COPY ./tools/init_wp.sh /var/www/wp

# WORKDIR /var/www/wp

# RUN chmod +x init_wp.sh \
#     && chown ${WP_USER}:${WP_USER} init_wp.sh

# USER ${WP_USER}

# ENTRYPOINT ["./init_wp.sh"]
FROM alpine:3.18.6

ARG WP_USER=test

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    curl \
    mariadb-client \
    php81 php81-fpm php81-mysqli php81-json php81-openssl php81-curl \
    php81-zlib php81-xml php81-phar php81-intl php81-dom php81-mbstring \
    php81-opcache php81-gd php81-redis \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/bin/wp \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* \
    && addgroup -S ${WP_USER} -g 1000 \
    && adduser -S -G ${WP_USER} ${WP_USER} \
    && mkdir -p /var/www/wp \
    && chown -R ${WP_USER}:${WP_USER} /var/www/wp

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
COPY ./tools/init_wp.sh /var/www/wp

WORKDIR /var/www/wp

RUN chmod +x init_wp.sh \
    && chown ${WP_USER}:${WP_USER} init_wp.sh \
	&& mkdir -p /var/log/php81 \
	&& chown -R ${WP_USER}:${WP_USER} /var/log/php81

USER ${WP_USER}

ENTRYPOINT ["./init_wp.sh"]