FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache mariadb mariadb-client \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod -R 755 /var/run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod -R 755 /var/lib/mysql \
    && mkdir -p /var/log/mysql \
    && chown -R mysql:mysql /var/log/mysql \
    && chmod -R 755 /var/log/mysql \
    && mysql_install_db --user=mysql --datadir=/var/lib/mysql 
	# && sed -i "s|skip-networking|# skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf \
    # && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY ./tools/init_db.sh .

RUN chown mysql:mysql ./init_db.sh \
    && chmod +x /init_db.sh

USER mysql:mysql

ENTRYPOINT ["./init_db.sh"]
