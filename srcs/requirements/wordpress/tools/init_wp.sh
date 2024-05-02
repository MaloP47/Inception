#!/bin/sh

MDB_DB=maindb
MDB_ADMIN=maindbuser
MDB_ADMIN_PASS=maindbpass
MDB_ROOT_PASS=maindbroot

MYURL=mpeulet.42.fr
MYSITE=inception
WP_ADMIN=malop
WP_ADMPASS=Test123
WP_ADM_MAIL=malop@inception.fr

WP_AUTHOR=malo
WP_AUTHOR_MAIL=malo@inception.fr
WP_AUTHOR_PASS=Test123


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
