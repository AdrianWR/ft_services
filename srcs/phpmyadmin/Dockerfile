FROM alpine:3.11.6

COPY setup.sh /tmp/
ENV PMA_VERSION 5.0.2

RUN apk update
RUN apk add curl lighttpd php7 php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-session php-mbstring php7-openssl php7-zlib php7-json php-iconv php-mbstring

EXPOSE 80

ENTRYPOINT ["/tmp/setup.sh"]
