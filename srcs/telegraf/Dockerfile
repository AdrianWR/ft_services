FROM alpine:3.11.6

RUN apk update
RUN apk add telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

EXPOSE 8086
ENTRYPOINT ["tail", "-f", "/dev/null"]
