FROM alpine:3.11.6

WORKDIR /usr/share/grafana

RUN apk update
RUN apk add grafana \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN	 mkdir -p /var/lib/grafana/dashboards
COPY srcs/datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY srcs/dashboards.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY srcs/telegraf.conf /etc/telegraf.conf
COPY srcs/data.json /var/lib/grafana/dashboards/

EXPOSE 3000

ENTRYPOINT ["/usr/sbin/grafana-server", "web"]
