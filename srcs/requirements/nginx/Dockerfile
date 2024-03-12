FROM alpine:3.18

ARG SSL_PASSPHRASE
ARG SSL_PASSWORD_FILE
# ARG SSL_CERTIFICATE
# ARG SSL_CERTIFICATE_KEY

ADD config/default.conf /tmp/default.conf
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/certs /etc/nginx/ssl

RUN apk add --update --no-cache nginx gettext\
	&& echo ${SSL_PASSPHRASE} > ${SSL_PASSWORD_FILE}\
	&& envsubst '${SSL_PASSWORD_FILE} ${SSL_CERTIFICATE} ${SSL_CERTIFICATE_KEY}' < /tmp/default.conf > /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

