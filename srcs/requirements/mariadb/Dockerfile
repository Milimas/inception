FROM alpine:3.18

ARG DB_ROOT_PASS
ARG DB_PASS
ARG DB_NAME
ARG DB_USER

RUN cat <<EOF > tmp.db 
USE mysql;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${DB_ROOT_PASS}') ;
DROP DATABASE IF EXISTS test ;
CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON $DB_NAME.* to '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES ;
EOF

RUN apk add --update --no-cache mariadb\
	&& mkdir -p /run/mysqld\
	&& chown -R mysql:mysql /run/mysqld

ADD --chmod=744 tools/run.sh .

ENTRYPOINT ["./run.sh"]
