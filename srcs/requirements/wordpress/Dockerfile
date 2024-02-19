FROM alpine:3.18

RUN apk add --no-cache curl
RUN apk add --no-cache make

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli

RUN apk add --update --no-cache php81 \
	php81-phar \
	php81-fpm \
	php81-mysqli \
	php81-iconv \
	php81-redis \
	php81-ctype

RUN sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf
ADD tools/Makefile /scripts/Makefile
WORKDIR /var/www/
ENTRYPOINT [ "make", "-f", "/scripts/Makefile" ]
