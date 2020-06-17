FROM alpine:3.11.6

RUN apk add --no-cache mysql mysql-client
COPY srcs/setup.sh /tmp/

EXPOSE 3306

ENTRYPOINT ["/tmp/setup.sh"]
