FROM alpine:3.18

#RUN apk add --update --no-cache adminer
RUN wget -q https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php && \
	mkdir -p /var/www/ && mv adminer-4.8.1-mysql.php /var/www/index.php && \
	apk add --update --no-cache php81 php81-session php81-pdo_mysql

ENTRYPOINT ["php"]
CMD ["-S", "0.0.0.0:8080", "-t", "/var/www/"]
