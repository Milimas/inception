FROM alpine:3.18

COPY portfolio /var/www

WORKDIR /var/www

RUN apk add --update --no-cache npm \ 
	&& npm install \
	&& npm run build

ENTRYPOINT ["npm"]
CMD ["start"]
