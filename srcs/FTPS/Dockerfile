FROM alpine:latest

RUN apk upgrade
RUN apk add openrc openssl --no-cache
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN apk add --update --no-cache telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY /srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 21 21000 

CMD ./setup.sh
