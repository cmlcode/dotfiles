#!/bin/bash

# Based off of github.com/ericmurphyxyz/rofi-wifi-menu/

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "disabled" ]]; then
	rofi -e "WIFI Disabled."
	exit 0
fi

rofi -e "Scanning for networks, please wait" &
popup_pid=$!

# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli -t -f "SSID,SIGNAL,SECURITY" device wifi list | \
	awk -F: '$2 >= 40 && !seen[$1]++' | \
	while IFS=: read -r ssid signal security; do
		# Skips hidden SSIDS
		[[ -z "$ssid" ]] && continue

		icon=""
		[[ "$security" =~ WPA|WEP ]] && icon=""
		printf "%s\t%s\n" "$icon" "$ssid"
	done)
kill $popup_pid 2>/dev/null

echo "$wifi_list" > ~/test.txt

# Use rofi to select wifi network
chosen_network=$(echo -e "$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )
# Get name of connection
chosen_id=$(echo "$chosen_network" | cut -f2-)

if [ "$chosen_network" = "" ]; then
	rofi -e "No network chosen"
else
	# Message to show when connection is activated successfully
  success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
  fail_message="Failed to connect to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)

	if echo "$saved_connections" | grep -Fxq "$chosen_id"; then
		connection_message=$(nmcli connection up id "$chosen_id")
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
			if [[ -z "$wifi_password" ]]; then
				rofi -e "No password entered. Connection cancelled."
				exit 1
			fi
		fi
		connection_message=$(nmcli device wifi connect "$chosen_id" password "$wifi_password")
	fi

	if echo "${connection_message}" | grep -q "successfully"; then
		rofi -e "${success_message}"
	else
		rofi -e "${fail_message} Output: ${connection_message}"
	fi
fi
