#!/bin/sh

openssl req -x509 -nodes -days 365 							\
			-newkey rsa:2048 -subj							\
			"/C=BR/ST=br/L=Brasil/O=42SP/CN=ft_services"	\
			-keyout /etc/ssl/private/vsftpd.key				\
			-out /etc/ssl/certs/vsftpd.crt

adduser -D $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf
