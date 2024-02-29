FROM alpine:3.18

RUN apk add --update --no-cache php81

ADD portfolio /var/www

WORKDIR /var/www
ENTRYPOINT ["php"]
CMD ["-q", "-S", "0.0.0.0:3000", "-t", "/var/www"]
