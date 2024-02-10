FROM alpine:latest
LABEL maintainer="abeihaqi@student.1337.ma"
RUN apk add --update --no-cache nginx  
RUN mkdir -p /var/www/wordpress/
COPY config/default.conf /etc/nginx/http.d/
COPY config/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

