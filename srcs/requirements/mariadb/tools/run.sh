#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp.db
	rm -f tmp.db
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0
