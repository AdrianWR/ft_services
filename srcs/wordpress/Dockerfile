FROM alpine:3.11.6

RUN apk update
RUN apk add	curl nginx mysql-client php7-fpm php7-common				\
    		php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli	\
    		php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap	\
    		php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap	\
    		php7-ctype php7-dom php7-openssl php7-gmp php7-pdo_odbc     \
    		php7-zip php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath	\
    		php7-odbc php7-pdo_sqlite php7-xmlreader php7-bz2 php7-pdo_dblib

#RUN apk add curl nginx mysql-client php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

ENV WP_VERSION 5.4.2

COPY setup.sh /tmp/
COPY wordpress.sql /tmp/

EXPOSE 80 5000

ENTRYPOINT ["/tmp/setup.sh"]
