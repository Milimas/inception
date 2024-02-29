FROM alpine:3.18

ARG DOMAIN
ARG CPNAME=/.${DOMAIN}/${DOMAIN}

ADD config/default.conf /etc/nginx/http.d/
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD config/certs /etc/nginx/ssl

RUN apk add --update --no-cache nginx

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

