FROM alpine:3.11.6

RUN apk update
RUN apk add influxdb curl jq libc6-compat
RUN curl -LO https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz && \
    tar xf telegraf-1.16.1_linux_amd64.tar.gz --strip 2

ENV API_URL=https://kubernetes

COPY setup.sh /tmp/

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]
