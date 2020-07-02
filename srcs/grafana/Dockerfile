FROM alpine:3.11.6

WORKDIR /usr/share/grafana

RUN apk update
RUN apk add grafana \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

#COPY srcs/datasources.yml /usr/share/grafana/conf/provisioning/datasources/
#COPY srcs/dashboards.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY dashboards/ /usr/share/grafana/public/dashboards/

EXPOSE 3000

ENTRYPOINT ["/usr/sbin/grafana-server", "web"]
