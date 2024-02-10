FROM alpine:3.18

RUN apk add --update --no-cache php php-fpm mariadb-client
WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz

RUN sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf

ADD ./config/wp-config.php /var/www/wordpress/wp-config.php

CMD ["php-fpm81", "-F"]

