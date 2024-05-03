#!/bin/sh

mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB_DB}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${MDB_ADMIN}\`@'localhost' IDENTIFIED BY '${MDB_ADMIN_PASS}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MDB_DB}\`.* TO \`${MDB_ADMIN}\`@'%' IDENTIFIED BY '${MDB_ADMIN_PASS}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASS}';"

mysql -e "DROP DATABASE IF EXISTS test;"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

exec mysqld_safe;
