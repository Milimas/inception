FROM alpine:3.18.6

ARG SSL_PASSPHRASE
ARG SSL_PASSWORD_FILE
ARG SSL_CERTIFICATE
ARG SSL_CERTIFICATE_KEY

ADD config/default.conf /tmp/default.conf
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/abeihaqi.42.fr.conf /tmp/abeihaqi.42.fr.conf

RUN apk add --update --no-cache openssl nginx gettext\
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${SSL_CERTIFICATE_KEY} -out ${SSL_CERTIFICATE} -config /tmp/abeihaqi.42.fr.conf\
	&& echo ${SSL_PASSPHRASE} > ${SSL_PASSWORD_FILE}\
	&& envsubst '${SSL_PASSWORD_FILE} ${SSL_CERTIFICATE} ${SSL_CERTIFICATE_KEY}' < /tmp/default.conf > /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

