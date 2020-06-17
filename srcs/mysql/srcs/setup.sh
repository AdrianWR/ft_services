#!/bin/sh

if [[ ! -d /var/run/mysqld ]]; then
	mkdir -p /var/run/mysqld
	chown -R mysql:mysql /var/run/mysqld
fi

if [[ ! -d /data/mysql ]]; then
	mysql_install_db --user=root --datadir=/data
	
	if [[ $MYSQL_ROOT_PASSWORD == "" ]]; then
		MYSQL_ROOT_PASSWORD = "admin"
	fi
	
	tfile=`mktemp`
	cat > $tfile << EOF
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF
	
	/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
	rm -f $tfile
fi

exec /usr/bin/mysqld --user=root --console
