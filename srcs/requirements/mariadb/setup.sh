#!/bin/sh

echo ""
echo "Start container mariadb..."

# check if database exists
if [ -e /var/lib/mysql/ib_logfile0 ]
then
    echo "Database exists"

    # start mariadb
    echo "Start mariadb..."
    /usr/bin/mariadbd-safe --nowatch
else
    # create database
    echo "Create database..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    # start mariadb
    echo "Create database - start mariadb..."
    /usr/bin/mariadbd-safe --nowatch

    # check if mariadb is running
    if pgrep -x /usr/bin/mariadbd > /dev/null
    then
        # create root user with remote access
        echo "Create database - configure root user..."
        mysql -e "USE mysql;"
	mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
    else
        echo "Create database - FAILED"
    fi
fi

# check if mariadb is running
if pgrep -x /usr/bin/mariadbd > /dev/null
then
    echo "----------------------------------------------------"
    echo "Start container mariadb - OK - ready for connections"
    echo "----------------------------------------------------"
    echo "host: $(hostname -i)"
    echo "port: 3306"
    echo "user: root"
    echo "password: $ROOT_PASSWORD"
    echo "----------------------------------------------------"
else
    echo "Start container mariadb - FAILED - exit"
    echo "---------------------------------------"
    exit 1
fi
exec mariadbd-safe --no-watch
