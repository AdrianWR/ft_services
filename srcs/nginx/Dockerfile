FROM alpine

RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache openssh-server
RUN apk add --no-cache telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/index.html /var/www/html/
COPY ./srcs/setup.sh /tmp/

RUN chmod 755 tmp/setup.sh
RUN mkdir -p /ssl/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -subj '/CN=localhost'

EXPOSE 80 443 22

ENTRYPOINT ["/tmp/setup.sh"]
