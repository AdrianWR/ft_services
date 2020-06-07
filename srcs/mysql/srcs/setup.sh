#!/bin/sh

MYSQL_DATA_DIR=/data
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

if [ ! -d $MYSQL_DATA_DIR/mysql ]
then
	echo "instalando"
	/usr/bin/mysql_install_db --user=mysql --datadir=$MYSQL_DATA_DIR
	chown mysql:mysql $MYSQL_DATA_DIR
	/usr/bin/mysqld --user=root --bootstrap --verbose=0 < /tmp/mysql.sql
fi

telegraf & exec /usr/bin/mysqld --user=root --console
