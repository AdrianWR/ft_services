FROM alpine:3.11.6

RUN apk update
RUN apk add influxdb curl jq
RUN apk add telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENV API_URL=https://kubernetes
#RUN export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

COPY setup.sh /tmp/

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]
