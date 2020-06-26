#!/bin/sh

#export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
telegraf --config /etc/telegraf.conf --config-directory /etc/telegraf.conf.d & \
influxd -config /etc/influxdb.conf
