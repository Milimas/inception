FROM alpine:3.18

ARG DOMAIN
ARG CPNAME=/.${DOMAIN}/${DOMAIN}

COPY config/default.conf /etc/nginx/http.d/
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/${DOMAIN}.conf /.${DOMAIN}/${DOMAIN}.conf

RUN apk add --update --no-cache nginx openssl \
	&& openssl genrsa -out ${CPNAME}.key 4096 \
	&& openssl req -new -out ${CPNAME}.csr -key ${CPNAME}.key -config ${CPNAME}.conf \
	&& openssl x509 -req -days 8030 -in ${CPNAME}.csr -signkey ${CPNAME}.key -out ${CPNAME}.crt -extensions v3_req -extfile ${CPNAME}.conf

#workdir /

ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]

