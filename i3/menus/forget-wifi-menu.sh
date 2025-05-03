#!/bin/bash

saved_connections=$(nmcli -g NAME connection)
chosen_network=$(echo -e "$saved_connections" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )

if [[ -z "$chosen_network" ]]; then
	exit 0
fi

status_txt=$(nmcli connection delete id "${chosen_network}")


if echo "${status_txt}" | grep -q "successfully"; then
	notify-send "Connection ${chosen_network} deleted"
else
	notify-send "Failed to delete connection ${chosen_network}"
fi
