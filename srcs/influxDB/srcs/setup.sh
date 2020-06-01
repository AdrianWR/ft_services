#!/bin/sh

export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
telegraf & influxd -config /etc/influxdb.conf
