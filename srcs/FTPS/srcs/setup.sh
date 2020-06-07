#!/bin/sh
FTP_USER=admin
FTP_PASSWORD=admin
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf

mkdir -p /ftps/$FTP_USER

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=BR/ST=br/L=Brasil/O=42 SP/CN=phippy" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

adduser -h /ftps/$FTP_USER -D $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

telegraf & /usr/sbin/pure-ftpd -j -Y 1 -p 21000:21000 -P "192.168.99.134"
