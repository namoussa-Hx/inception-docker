#!/bin/sh


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html
rm -rf *


wp core download --allow-root
wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
wp plugin update --all --allow-root

exec /usr/sbin/php-fpm7.3 -F


