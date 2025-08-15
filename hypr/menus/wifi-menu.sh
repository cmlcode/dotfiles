#!/bin/bash

STATION="wlan0"

CURR_SSID=$(iwctl station $STATION show | sed -n 's/^\s*Connected\snetwork\s*\(\S*\)\s*$/\1/p')
networks=$(iwctl station "$STATION" get-networks | awk '
/^[[:space:]]+\S/ && !/SSID|Security|Signal|^\s*--/ { print $1 }
' | grep -vE '^\*?$|^Available$' | sort -u)

if [ -n "$CURR_SSID" ] && ! grep -Fxq "$current_ssid" <<< "$networks"; then
    networks="$CURR_SSID"$'\n'"$networks"
fi

if [ -z "$networks" ]; then
	notify-send "No wifi networks found."
	exit 1
fi

selected=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi")

if [ -z "$selected" ]; then
	notify-send -t 1000 "No wifi network selected."
	exit 1
fi

if iwctl station "$STATION" connect "$selected";then
	notify-send "Connected to $selected"
else
	notify-send "Failed to connect to $selected"
fi
