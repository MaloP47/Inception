# #!/bin/sh

# # Create the wp-config.php file
# wp config create --dbname=${MDB_DB} \
#                     --dbuser=${MDB_ADMIN} \
#                     --dbpass=${MDB_ADMIN_PASS} \
#                     --dbhost=mariadb:3306

# # Install WordPress
# wp core install --url=${MYURL} \
#                 --title=${MYSITE} \
#                 --admin_user=${WP_ADMIN} \
#                 --admin_password=${WP_ADMPASS} \
#                 --admin_email=${WP_ADM_MAIL};

# sleep 5;

# # Create an additional WordPress author user
# wp user create ${WP_AUTHOR} ${WP_AUTHOR_MAIL} \
#                 --user_pass=${WP_AUTHOR_PASS} \
#                 --role=author;

# # Install and activate a theme, e.g., twentytwentyfour
# wp theme install twentytwentyfour --activate;

# # Optional: Display the status of the installed theme
# wp theme status twentytwentyfour;



# # Execute the PHP FastCGI Process Manager
# /usr/sbin/php-fpm81 -F

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
	wp-cli config create --allow-root --dbname=$MDB_DB --dbuser=$MDB_ADMIN \
		--dbpass=$MDB_ADMIN_PASS --dbhost=mariadb:3306
	wp-cli core install --url=$MYURL --title=$MYSITE --admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADM_MAIL
	wp-cli user create $WP_AUTHOR $WP_AUTHOR_MAIL --role=author --user_pass=$WP_AUTHOR_PASS

fi

# running php
/usr/sbin/php-fpm81 -F
