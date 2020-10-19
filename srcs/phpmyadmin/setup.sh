#!/bin/sh

PMA_PACKAGE=phpMyAdmin-$PMA_VERSION-all-languages.tar.gz

if [[ ! -d /var/run/nginx ]]; then
	mkdir -p /var/run/nginx
fi

if [[ ! -f /var/www/localhost/htdocs/index.php ]]; then

	curl -SL https://files.phpmyadmin.net/phpMyAdmin/$PMA_VERSION/phpMyAdmin-$PMA_VERSION-all-languages.tar.xz \
	| tar -xJC /var/www/localhost/htdocs --strip 1

fi

#chown -R nginx:nginx /var/www/localhost
#chmod -R 755 /var/www/localhost/

php-fpm7 & nginx -g "daemon off;"
