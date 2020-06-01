#!/bin/sh

mkdir -p /var/lib/grafana/dashboards

export TELEGRAF_CONFIG_PATH="/etc/telegraf.conf"
telegraf & /usr/sbin/grafana-server web
