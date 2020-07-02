FROM alpine:latest

RUN apk upgrade
RUN apk add openssl vsftpd

COPY setup.sh /tmp/

EXPOSE 20 21 30000

ENTRYPOINT ["/tmp/setup.sh"]
