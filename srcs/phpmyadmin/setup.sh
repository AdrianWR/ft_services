#!/bin/sh

PMA_PACKAGE=phpMyAdmin-$PMA_VERSION-all-languages.tar.gz

if [[ ! -d /var/run/lighttpd ]]; then
	mkdir -p /var/run/lighttpd
	chown -R lighttpd:lighttpd /var/run/lighttpd
fi

sed -i '/"mod_fastcgi.conf"/s/^#*\s*//g' /etc/lighttpd/lighttpd.conf
sed -i '/bin-path/s/\<php-cgi\>/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf

if [[ ! -f /var/www/localhost/htdocs/index.php ]]; then

	curl -SL https://files.phpmyadmin.net/phpMyAdmin/$PMA_VERSION/phpMyAdmin-$PMA_VERSION-all-languages.tar.xz \
	| tar -xJC /var/www/localhost/htdocs --strip 1

fi

chmod -R 755 /var/www/localhost/
chown -R lighttpd:lighttpd /var/www/localhost

lighttpd -D -f /etc/lighttpd/lighttpd.conf
