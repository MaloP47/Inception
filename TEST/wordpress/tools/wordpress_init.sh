#!/bin/bash

# creating user www-data
adduser -D www-data -G www-data

# testing if wordpress is already installed
if [ -f /var/www/html/wp-config.php ]; then
	echo "Worpress already downloaded"
else
	# creating html folder for wordpress
	if [ ! -d /var/www/html ]; then
		mkdir /var/www/html
	fi
	chown -R www-data:www-data /var/www/html
	cd /var/www/html
	echo "Downloading wordpress..."
	curl https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -o wp.tar.gz
	# unziping wordpress
	tar xfz wp.tar.gz
	rm -rf wp.tar.gz
	mv wordpress/* .
	sleep 5
	# configuring wordpress with the cli
	wp-cli config create --allow-root --dbname=$MYSQL_DB --dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PSW --dbhost=mariadb:3306
	wp-cli core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PSW --admin_email=$WP_ADMIN_EMAIL
	wp-cli user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PSW

	# adding manually info in wp-config for redis plugin
	sed -i "s/require_once/define('WP_REDIS_HOST', 'redis');\nrequire_once/g" wp-config.php
	sed -i "s/require_once/define('WP_REDIS_PORT', '6379');\nrequire_once/g" wp-config.php
	# installing redis plugin with the cli
	wp-cli plugin install redis-cache --activate --allow-root
	wp-cli plugin update --all --allow-root
	wp-cli redis enable --allow-root
	# www-data own html folder for redis
	chown -R www-data:www-data /var/www/html
fi

# running php
/usr/sbin/php-fpm81 -F
