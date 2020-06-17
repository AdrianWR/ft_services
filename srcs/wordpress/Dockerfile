FROM alpine:3.11.6

COPY srcs/setup.sh /tmp/
#RUN apk add --no-cache telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENV WP_VERSION 5.4.2

RUN apk update
RUN apk add lighttpd mysql-client php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
ADD https://wordpress.org/wordpress-$WP_VERSION.tar.gz /tmp/

EXPOSE 80

ENTRYPOINT ["/tmp/setup.sh"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
