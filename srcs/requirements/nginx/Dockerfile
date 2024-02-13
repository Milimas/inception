FROM alpine:latest
LABEL maintainer="abeihaqi@student.1337.ma"
RUN apk add --update --no-cache nginx  
RUN mkdir -p /var/www/wordpress/
COPY config/default.conf /etc/nginx/http.d/
COPY config/nginx.conf /etc/nginx/nginx.conf

# create ssl certificate
ARG DOMAIN="abeihaqi.42.fr"
RUN apk add --no-cache openssl
COPY config/${DOMAIN}.conf /.${DOMAIN}/${DOMAIN}.conf
workdir /.${DOMAIN}
RUN openssl genrsa -out ${DOMAIN}.key 4096
RUN openssl req -new -out ${DOMAIN}.csr -key ${DOMAIN}.key -config ${DOMAIN}.conf -batch
RUN openssl x509 -req -days 8030 -in ${DOMAIN}.csr -signkey ${DOMAIN}.key -out ${DOMAIN}.crt -extensions v3_req -extfile ${DOMAIN}.conf

workdir /
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]

