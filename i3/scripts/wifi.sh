#!/bin/bash

ACTIVE_CONNECTION=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi list --rescan no | grep '^yes')

if [ -z "${ACTIVE_CONNECTION}" ]; then
	echo "None: 0%"
	exit 0
fi

filtered_conn=${ACTIVE_CONNECTION#yes:}
IFS=':' read -r conn_name conn_strength <<< "${filtered_conn}" 

echo "${conn_name}: ${conn_strength}%"
exit 0
