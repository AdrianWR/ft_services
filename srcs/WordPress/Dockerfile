FROM alpine:latest

COPY ./srcs/ /tmp/
RUN apk update
RUN apk add lighttpd mysql-client
RUN apk add --update --no-cache telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add php7 php7-openssl php7-cgi php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib php7-json
#ADD https://wordpress.org/latest.tar.gz /tmp/

EXPOSE 5050

ENTRYPOINT ["sh", "/tmp/setup.sh"]
