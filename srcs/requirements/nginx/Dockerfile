FROM alpine:latest
LABEL maintainer="abeihaqi@student.1337.ma"
RUN apk add --no-cache nginx php7.2 php7.2-cli php7.2-fpm php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl
RUN mkdir -p /var/www/html/wordpress/public_html
COPY config/default.conf /etc/nginx/http.d/
COPY config/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

