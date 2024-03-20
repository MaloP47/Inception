FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add mariadb mariadb-client \
    && rm -rf /var/cache/apk/*

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init_db.sh /

RUN chmod +x /init_db.sh

CMD ["mysqld_safe"]
