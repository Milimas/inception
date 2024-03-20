FROM alpine:3.18.6

ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php /var/www/index.php

ADD https://raw.githubusercontent.com/pepa-linha/Adminer-Design-Dark/81eb3c48708b0132977d63a1948920cc1cefdefa/adminer.css /var/www/

RUN apk add --update --no-cache php81 php81-session php81-pdo_mysql

ENTRYPOINT ["php"]
CMD ["-q", "-S", "0.0.0.0:8080", "-t", "/var/www/"]
