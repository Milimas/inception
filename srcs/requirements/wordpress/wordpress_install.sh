#!/bin/sh

echo "wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb"
sleep 1
echo "Creating wp-config.php ..."
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST
echo "Creating database $DB_NAME"
wp db create
echo "Installing wordpress ..."
wp core install --url="localhost" --title="inception" --admin_user="admin" --admin_password="admin" --admin_email="abeihaqi@student.1337.ma"
echo "Running php-fpm ..."
php-fpm81 -F
