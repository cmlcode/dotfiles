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
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")
kill $popup_pid 2>/dev/null

# Use rofi to select wifi network
chosen_network=$(echo -e "$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )
# Get name of connection
read -r chosen_id <<< "${chosen_network#* }"

if [ "$chosen_network" = "" ]; then
	exit
else
	# Message to show when connection is activated successfully
  success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
  fail_message="Failed to connect to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		connection_message=$(nmcli connection up id "$chosen_id")
		if echo "${connection_message}" | grep -q "successfully"; then
			echo "${success_message}"
		else
			echo "${fail_message}"
			echo "${connection_message}"
		fi
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
			if [[ -z "$wifi_password" ]]; then
				rofi -e "No password entered. Connection cancelled."
				exit 1
			fi
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully"
    fi
fi
