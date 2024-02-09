FROM alpine:latest
RUN apk add --no-cache mariadb mariadb-client 

RUN mkdir -p /var/lib/mysql
RUN /etc/init.d/mariadb setup

VOLUME ["/var/lib/mysql"]
VOLUME ["/etc/my.cnf.d"]

COPY . .

LABEL version="1.0"
LABEL description="MariaDB Server"
Label maintainer="abeihaqi@student.1337.ma"

#RUN chown -R mysql:mysql /var/lib/mysql
#RUN mkdir -p /run/openrc
#RUN mkdir -p /run/openrc/exclusive
#RUN mkdir -p /run/openrc/softlevel
#RUN rc-update add mariadb default

ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD

#RUN chmod +x /setup.sh
#RUN sh -c /setup.sh

#ENTRYPOINT ["/setup.sh"]

EXPOSE 3306
