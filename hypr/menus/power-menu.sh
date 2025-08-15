#!/bin/bash
lock=""
logout=""
shutdown=""
reboot=""

selected_option=$(echo "$shutdown
$lock
$logout
$reboot" | rofi -dmenu\
	-i\
	-p "Power"\
	-theme "$HOME/.config/hypr/menus/power-menu-config.rasi")

case "$selected_option" in 
	"$lock")
		betterlockscreen --lock
		;;
	"$logout")
		hyprctl dispatch exit
		;;
	"$shutdown")
		systemctl poweroff
		;;
	"$reboot")
		systemctl reboot
		;;
	*)
		echo "No valid option selected"
		;;
esac
