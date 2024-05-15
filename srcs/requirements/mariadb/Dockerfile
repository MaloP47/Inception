FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache mariadb mariadb-client mariadb-server-utils \
    && rm -rf /var/cache/apk/* \
    && mysql_install_db --user=mysql --ldata=/var/lib/mysql \
    && mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld \
    && chmod -R 755 /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod -R 755 /var/lib/mysql
	
COPY ./tools/init_db.sh /scripts/
RUN chmod +x /scripts/init_db.sh

ENTRYPOINT ["/scripts/init_db.sh"]
