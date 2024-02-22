FROM alpine:3.18

COPY portfolio /var/www

WORKDIR /var/www

RUN apk add --update --no-cache npm && \
	npm install && npm build

ENTRYPOINT ["tail"]

CMD ["tail", "-f", "/dev/null"]
