#!/bin/sh

MDB_DB="inception-db"
MDB_USER="inception-db-user"
MDB_USER_PASSWORD="dbuserpass123"
MDB_ROOT_PASSWORD="dbrootpass123"

mysqld_safe &

until mysqladmin ping; do
    echo "Waiting for mariadb to be ready..."
    sleep 2
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB_DB}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'localhost' IDENTIFIED BY '${MDB_USER_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MDB_DB}\`.* TO \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_USER_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

mysql -e "DROP DATABASE IF EXISTS test;"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe;
