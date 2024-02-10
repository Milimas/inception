FROM alpine:3.17.2

# expose port
EXPOSE 3306

ENV ROOT_PASSWORD 123

# update apk repositories
RUN apk update

# upgrade all
RUN apk upgrade

# install mariadb
RUN apk add --no-cache \
	mariadb \
	mariadb-client \
	openrc

RUN openrc
RUN touch /run/openrc/softlevel

# enable remote connections to mariadb from any IP
RUN sed -i 's|skip-networking|#skip-networking|g' /etc/my.cnf.d/mariadb-server.cnf
RUN sed -i 's|#bind-address=0.0.0.0|bind-address=0.0.0.0|g' /etc/my.cnf.d/mariadb-server.cnf

#RUN rc-service mariadb setup
#RUN rc-service mariadb start


# add entry point script
ADD --chown=root:root setup.sh /tmp/start.sh

# make entry point script executable
RUN chmod +x /tmp/start.sh

# set working dir
WORKDIR /var/lib/mysql/

# run script
CMD ["/tmp/start.sh"]
