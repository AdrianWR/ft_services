FROM alpine:3.11.6

WORKDIR /usr/share/grafana

RUN apk update
RUN apk add grafana \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY dashboards/ /usr/share/grafana/public/dashboards/

EXPOSE 3000

ENTRYPOINT ["grafana-server"]
CMD ["web"]
