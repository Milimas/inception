FROM alpine:3.18.6

RUN apk add --update --no-cache php81

ADD portfolio /var/www

ENTRYPOINT ["php"]
CMD ["-q", "-S", "0.0.0.0:3000", "-t", "/var/www"]
