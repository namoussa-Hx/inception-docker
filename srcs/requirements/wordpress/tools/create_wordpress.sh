#!/bin/sh

sleep 3


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
wp core install --url=$DOMAIN_NAME --title=$WP_TITL --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL  --allow-root



wp plugin install redis-cache --activate --allow-root


wp config set WP_CACHE true --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp config set WP_REDIS_DATABASE 0 --allow-root
wp config set WP_REDIS_MAXTTL 3600 --allow-root
wp config set WP_REDIS_TIMEOUT 1 --allow-root
wp config set WP_REDIS_READ_TIMEOUT 1 --allow-root

wp redis enable --allow-root


wp plugin update --all --allow-root


exec /usr/sbin/php-fpm8.2 -F


