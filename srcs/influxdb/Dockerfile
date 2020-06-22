FROM alpine:3.11.6

RUN apk update
RUN apk add influxdb
RUN apk add telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
COPY ./srcs/ /tmp/
RUN chmod 755 /tmp/setup.sh

EXPOSE 8086 8088
ENTRYPOINT ["/tmp/setup.sh"]
