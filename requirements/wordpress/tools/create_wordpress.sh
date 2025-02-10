#!/bin/sh


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html
rm -rf *



wp core download --allow-root
sed -i "s/username_here/$WP_DATABASE_USR/g" wp-config-sample.php
sed -i "s/password_here/$WP_DATABASE_PWD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$WP_DATABASE_NAME/g" wp-config-sample.php


cp wp-config-sample.php wp-config.php

#wp config create --dbname=$WP_DATABASE_NAME --dbuser=$WP_DATABASE_USR --dbpass=$WP_DATABASE_PWD --dbhost=$MYSQL_HOSTNAME --allow-root
#wp config create --dbname=wordpress --dbuser=najib --dbpass=najib123 --dbhost=mariadb --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITL --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL  --allow-root
wp plugin update --all --allow-root

exec /usr/sbin/php-fpm8.2 -F


