#!/bin/sh

SSH_USER=admin
SSH_PASS=admin

mkdir -p /var/run/nginx

ssh-keygen -A
adduser --disabled-password ${SSH_USER}
echo "${SSH_USER}:${SSH_PASS}" | chpasswd
/usr/sbin/sshd

export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
#telegraf & nginx -g "pid /tmp/nginx.pid; daemon off;"
nginx -g "daemon off;"
#tail -f /dev/null
