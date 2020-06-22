FROM alpine:3.11.6

WORKDIR /usr/share/grafana

RUN apk add --update --no-cache grafana telegraf \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY srcs/datasources.yml /usr/share/grafana/conf/provisioning/datasources/
COPY srcs/dashboards.yml /usr/share/grafana/conf/provisioning/dashboards/
COPY srcs/telegraf.conf /etc/telegraf.conf
COPY srcs/data.json /var/lib/grafana/dashboards/
COPY srcs/setup.sh /tmp/

RUN chmod +x /tmp/setup.sh
EXPOSE 3000

CMD ["sh", "/tmp/setup.sh"]
