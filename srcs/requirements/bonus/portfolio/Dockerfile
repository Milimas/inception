FROM alpine:3.18

COPY portfolio /var/www

WORKDIR /var/www

RUN apk add --update --no-cache php81

EXPOSE 3000

ENTRYPOINT ["php"]
CMD ["-S", "0.0.0.0:3000"]
