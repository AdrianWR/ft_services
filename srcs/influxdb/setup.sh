#!/bin/sh

API_URL=https://kubernetes
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
export HOST_IP=$(curl -s $API_URL/api/v1/namespaces/$POD_NAMESPACE/pods/$HOSTNAME	\
    	         --header "Authorization: Bearer $TOKEN" --insecure | 				\
			     jq -r '.status.hostIP')

influxd &
telegraf --config /etc/telegraf.conf --config-directory /etc/telegraf.conf.d
