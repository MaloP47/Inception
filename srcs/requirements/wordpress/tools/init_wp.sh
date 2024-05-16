#!/bin/bash

if [ -f /var/www/html/wp-config.php ]; then
	:
else 
		curl https://fr.wordpress.org/wordpress-6.5.3-fr_FR.tar.gz -o wp.tar.gz
		tar xfz wp.tar.gz
		rm -rf wp.tar.gz
		mv wordpress/* .
		sleep 5
		wp-cli config create --allow-root --dbname=$MDB_DB --dbuser=$MDB_ADMIN \
		--dbpass=$MDB_ADMIN_PASS --dbhost=mariadb:3306
		wp-cli core install --url=$MYURL --title=$MYSITE --admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADM_MAIL
		wp-cli user create $WP_AUTHOR $WP_AUTHOR_MAIL --role=author --user_pass=$WP_AUTHOR_PASS

		chown -R wp-data:wp-data /var/www/html
fi

/usr/sbin/php-fpm81 -F
