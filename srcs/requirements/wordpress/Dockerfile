FROM alpine:3.18

RUN apk add --update --no-cache php-mysqli php php-fpm php-phar mysql-client
WORKDIR /var/www
#RUN wget https://wordpress.org/latest.tar.gz && \
	#tar -xzvf latest.tar.gz && \
	#rm latest.tar.gz

RUN sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf

#ADD ./config/wp-config.php /var/www/wordpress/wp-config.php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /sbin/wp
RUN wp core download --path=wordpress

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_HOST
#RUN wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb --path=wordpress
#RUN wp db create
#RUN wp core install --url=abeihaqi.42.fr --title="inception" --admin_user=admin --admin_password=admin --admin_email=abeihaqi@student.1337.ma
#
#CMD ["php-fpm81", "-F"]

WORKDIR /var/www/wordpress
COPY ./wordpress_install.sh /tmp/
RUN chmod +x /tmp/wordpress_install.sh
CMD ["/tmp/wordpress_install.sh"]
