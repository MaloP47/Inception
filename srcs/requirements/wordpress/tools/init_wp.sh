#!/bin/sh

MDB_NAME="mdb"
MDB_ADM="mdbadmin"
MDB_PASS="mdbpass"

MYURL="mpeulet.42.fr"
MYSITE="inception"
WP_ADMIN="malop"
WP_PASS="Today123"
WP_ADM_MAIL="malop@inception.fr"
WP_AUTHOR="malo"
WP_AUTHOR_PASS="Test123"
WP_AUTHOR_MAIL="malo@inception.fr"

# Ensure the working directory is correct, but it's already set by Dockerfile's WORKDIR
# cd /var/www/wp/ is not needed because of WORKDIR directive in Dockerfile

# Check if WordPress is already installed by checking wp-config.php presence
if [ ! -f wp-config.php ]; then

    # Update WP-CLI to the latest version
    wp cli update --yes --allow-root

    # Download WordPress core files
    wp core download --allow-root --version=6.5

    # Create the wp-config.php file
    wp config create --dbname="${MDB_NAME}" --dbuser="${MDB_ADM}" --dbpass="${MDB_PASS}" --dbhost="mariadb:3306" --allow-root

    # Install WordPress
    wp core install --url="${MYURL}" --title="${MYSITE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_ADM_MAIL}" --allow-root

	sleep 5
    # Create an additional WordPress author user
    wp user create "${WP_AUTHOR}" "${WP_AUTHOR_MAIL}" --user_pass="${WP_AUTHOR_PASS}" --role=author --allow-root

    # Install and activate a theme, e.g., twentytwentyfour
    wp theme install twentytwentyfour --activate --allow-root

    # Optional: Display the status of the installed theme
    wp theme status twentytwentyfour --allow-root

fi

# Execute the PHP FastCGI Process Manager
exec php-fpm81 -F
