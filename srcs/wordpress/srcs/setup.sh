#!/bin/sh

mkdir -p /run/lighttpd
touch /run/lighttpd/php-fastcgi.socket
chown -R lighttpd:lighttpd /run/lighttpd
mv /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf
mv /tmp/mod_fastcgi.conf /etc/lighttpd/mod_fastcgi.conf

if [ ! -d /var/www/wp-admin ]
then
    tar -zxvf /tmp/wordpress.tar.gz -C /tmp
    cp -r /tmp/wordpress/* /var/www/
    mv /tmp/wp-config.php /var/www/
    mysql -h 192.168.99.134 -uroot -padmin < /tmp/mysql.sql
    mysql -h 192.168.99.134 -uroot -padmin < /tmp/backup.sql
fi

chmod -R 755 /var/www/
chown lighttpd -R /var/www/

export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
telegraf & /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
