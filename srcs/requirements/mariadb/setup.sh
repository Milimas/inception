#!/bin/sh
set -e
mysqld_safe --datadir=/var/lib/mysql --user=mysql
