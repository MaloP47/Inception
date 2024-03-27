FROM alpine:3.18.6

RUN apk update \
    && apk upgrade \
    && apk add --no-cache mariadb mariadb-client \
    && rm -rf /var/cache/apk/* 

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tools/init_db.sh .

# RUN mkdir -p /var/run/mysqld \
#     && mkdir -p /var/lib/mysql \
#     && mkdir -p /var/log/mysql \
#     && chown -R mysql:mysql /var/lib/mysql \
#     && chown -R mysql:mysql /var/run/mysqld \
#     && chown -R mysql:mysql /var/log/mysqld \
#     && chmod -R 755 /var/lib/mysql \
#     && chmod -R 755 /var/run/mysqld \
#     && chmod -R 755 /var/log/mysqld \
#     && mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod -R 755 /var/run/mysqld && \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql && \
    mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql && \
    chmod -R 755 /var/log/mysql && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

RUN chown mysql:mysql ./init_db.sh \
    && chmod +x /init_db.sh

USER mysql:mysql

CMD ["./init_db.sh"]
