FROM alpine:3.18

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
RUN apk add --no-cache mariadb mariadb-client openrc && \
	openrc && \
	touch /run/openrc/softlevel && \
	sed -i 's|skip-networking|#skip-networking|g' /etc/my.cnf.d/mariadb-server.cnf && \
	sed -i 's|#bind-address=0.0.0.0|bind-address=0.0.0.0|g' /etc/my.cnf.d/mariadb-server.cnf && \
	rc-service mariadb setup && \
	rc-service mariadb start && \
	mysql -e "CREATE DATABASE $DB_NAME;" && \
	mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" && \
	mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;" && \
	mysql -e "FLUSH PRIVILEGES;"

ADD --chown=root:root tools/bootstrap.sh /tmp/bootstrap.sh

# make entry point script executable
RUN chmod +x /tmp/bootstrap.sh

# run script
ENTRYPOINT ["/tmp/bootstrap.sh"]
