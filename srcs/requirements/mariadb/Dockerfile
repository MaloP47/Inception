FROM debian:bullseye

RUN apt update \
    && apt upgrade \
    && apt-get install mariadb-server -y 

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init_db.sh /

CMD ["mysqld_safe"]
