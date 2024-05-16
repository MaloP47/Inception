#!/bin/sh

tmp_file=$(mktemp)
if [ ! -f "$tmp_file" ]; then
    return 1
fi

MDB_DB=${MDB_DB:-""}
MDB_ADMIN=${MDB_ADMIN:-""}
MDB_ADMIN_PASS=${MDB_ADMIN_PASS:-""}
MDB_ROOT_PASSWORD=${MDB_ROOT_PASSWORD:-""}

cat << EOF > "$tmp_file"
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASSWORD' WITH GRANT OPTION;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MDB_ROOT_PASSWORD');
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`$MDB_DB\` CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON \`$MDB_DB\`.* TO '$MDB_ADMIN'@'%' IDENTIFIED BY '$MDB_ADMIN_PASS';
EOF

/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < "$tmp_file"

rm -f "$tmp_file"

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0
