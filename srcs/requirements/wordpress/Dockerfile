FROM alpine:3.18.6

ADD --chmod=744 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp-cli
ADD tools/Makefile /scripts/Makefile

RUN apk add --update --no-cache\
	curl\
	make\
	php81\
	php81-phar\
	php81-fpm\
	php81-mysqli\
	php81-iconv\
	php81-redis\
	php81-ctype\
	&& sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/wordpress

ENTRYPOINT [ "make", "-f", "/scripts/Makefile" ]
