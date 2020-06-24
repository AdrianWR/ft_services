#!/bin/sh

if [[ ! -d /var/run/lighttpd ]]; then
	mkdir -p /var/run/lighttpd
	chown -R lighttpd:lighttpd /var/run/lighttpd
fi

sed -i '/"mod_fastcgi.conf"/s/^#*\s*//g' /etc/lighttpd/lighttpd.conf
sed -i '/bin-path/s/\<php-cgi\>/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

if [[ ! -f /var/www/localhost/htdocs/index.php ]]; then
	
	curl -SL https://wordpress.org/wordpress-$WP_VERSION.tar.gz \
	| tar -xzC /var/www/localhost/htdocs --strip 1

	tfile=`mktemp`
	cat > $tfile << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO '$WORDPRESS_USERNAME'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD';
FLUSH PRIVILEGES;
EOF

	mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD < $tfile
	rm -f $tfile

	mysql -hmysql -Dwordpress -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/wordpress.sql

fi

chmod -R 755 /var/www/localhost/
chown -R lighttpd:lighttpd /var/www/localhost

/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
