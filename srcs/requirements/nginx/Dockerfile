FROM alpine:3.18

ARG DOMAIN

RUN apk add --update --no-cache nginx  
#RUN mkdir -p /var/www/wordpress/
COPY config/default.conf /etc/nginx/http.d/
COPY config/nginx.conf /etc/nginx/nginx.conf

# create ssl certificate
RUN apk add --no-cache openssl

COPY config/${DOMAIN}.conf /.${DOMAIN}/${DOMAIN}.conf
workdir /.${DOMAIN}
#RUN openssl req -x509 -out ${DOMAIN}.crt -keyout ${DOMAIN}.key -newkey rsa:2048 -nodes \
#	-sha256 -extensions v3_req -config ${DOMAIN}.conf
RUN openssl genrsa -out ${DOMAIN}.key 4096
RUN openssl req -new -out ${DOMAIN}.csr -key ${DOMAIN}.key -config ${DOMAIN}.conf #-batch
RUN openssl x509 -req -days 8030 -in ${DOMAIN}.csr -signkey ${DOMAIN}.key -out ${DOMAIN}.crt -extensions v3_req -extfile ${DOMAIN}.conf

workdir /
ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]

