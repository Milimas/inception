#!/bin/sh
# check if dir exist if not create
# /var/lib/mysql must be owned by the mysql user
#if [ ! -d /var/lib/mysql ]; then
#	mkdir /var/lib/mysql
#	chown -R mysql:mysql /var/lib/mysql
#fi

#apk add openrc --no-cache
#if [ ! -d /run/openrc ]; then
#	mkdir /run/openrc
#	mkdir /run/openrc/exclusive
#	touch /run/openrc/softlevel
#rc-update add mariadb default
#fi

#/etc/init.d/mariadb setup
#rc-service mariadb start
#mysql_secure_installation << EOF
#
#y
#y
#$MYSQL_USER
#$MYSQL_PASSWORD
#y
#y
#y
#y
#EOF
