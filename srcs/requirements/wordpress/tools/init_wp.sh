#!/bin/sh

sleep 5

if [ ! -f wp-config.php ]; then
    # Create the wp-config.php file
    wp config create --dbname=${MDB_DB} \
                     --dbuser=${MDB_ADMIN} \
                     --dbpass=${MDB_ADMIN_PASS} \
                     --dbhost=mariadb:3306;

    # Install WordPress
    wp core install --url=${MYURL} \
                    --title=${MYSITE} \
                    --admin_user=${WP_ADMIN} \
                    --admin_password=${WP_ADMPASS} \
                    --admin_email=${WP_ADM_MAIL};

	sleep 5;

    # Create an additional WordPress author user
    wp user create ${WP_AUTHOR} ${WP_AUTHOR_MAIL} \
                    --user_pass=${WP_AUTHOR_PASS} \
                    --role=author;

    # Install and activate a theme, e.g., twentytwentyfour
    wp theme install twentytwentyfour --activate;

    # Optional: Display the status of the installed theme
    wp theme status twentytwentyfour;

fi

# Execute the PHP FastCGI Process Manager
exec php-fpm81 -F;
