#!/bin/sh

#SSH_USER=admin
#SSH_PASS=admin

mkdir -p /var/run/nginx

ssh-keygen -A
adduser --disabled-password ${SSH_USERNAME}
echo "${SSH_USERNAME}:${SSH_PASSWORD}" | chpasswd
/usr/sbin/sshd

nginx -g "daemon off;"
