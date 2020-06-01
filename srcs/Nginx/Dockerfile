FROM alpine:latest
RUN apk add --no-cache nginx
RUN apk add --no-cache openssl
RUN apk add --no-cache openssh-server
RUN apk add --no-cache telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

EXPOSE 80 443 1234
COPY ./srcs/ /root/

RUN chmod 755 root/setup.sh
RUN mv /root/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /ssl/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -subj '/CN=localhost'

RUN mkdir -p /var/www/html
RUN mv /root/index.html /var/www/html/
ENTRYPOINT ["/root/setup.sh"]
