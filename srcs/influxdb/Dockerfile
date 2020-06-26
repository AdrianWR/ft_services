FROM alpine:3.11.6

RUN apk update
RUN apk add influxdb
RUN apk add telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY setup.sh /tmp/

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
