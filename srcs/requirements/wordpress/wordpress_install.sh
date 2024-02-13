#!/bin/sh

sleep 1
mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST -e "select 1" || echo down
#wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST
#echo "Creating database $DB_NAME"
#wp db create
#echo "Installing wordpress ..."
#echo "Running php-fpm ..."
wp core install --path=/var/www/wordpress --url="abeihaqi.42.fr" --title="inception" --admin_user="admin" --admin_password="admin" --admin_email="abeihaqi@student.1337.ma"
php-fpm81 -F
