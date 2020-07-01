#!/bin/sh

if [[ ! -d /var/run/lighttpd ]]; then
	mkdir -p /var/run/lighttpd
	chown -R lighttpd:lighttpd /var/run/lighttpd
fi

sed -i "/server.username/s/lighttpd/$USERNAME/g" /etc/lighttpd/lighttpd.conf
sed -i "/server.groupname/s/lighttpd/$USERNAME/g" /etc/lighttpd/lighttpd.conf
sed -i '/"mod_fastcgi.conf"/s/^#*\s*//g' /etc/lighttpd/lighttpd.conf
sed -i '/bin-path/s/\<php-cgi\>/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

if [[ ! -f /var/www/localhost/htdocs/index.php ]]; then
	
	curl -SL https://wordpress.org/wordpress-$WP_VERSION.tar.gz \
	| tar -xzC /var/www/localhost/htdocs --strip 1

	tfile=`mktemp`
	cat > $tfile << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO '$USERNAME'@'localhost' IDENTIFIED BY '$WORDPRESS_PASSWORD';
FLUSH PRIVILEGES;
EOF

	mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD < $tfile
	rm -f $tfile

	mysql -hmysql -Dwordpress -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/wordpress.sql

fi

adduser --no-create-home -D $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
chmod -R 755 /var/www/
chown -R $USERNAME:$USERNAME /var/www/localhost	\
							 /var/log/lighttpd	\
							 /var/run/lighttpd

lighttpd -D -f /etc/lighttpd/lighttpd.conf
