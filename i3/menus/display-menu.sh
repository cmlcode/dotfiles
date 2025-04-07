#!/bin/bash

# Define display names
PRIMARY_DISPLAY="eDP"
EXTERNAL_DISPLAY=$(xrandr --query | grep " connected" | grep -v "$PRIMARY_DISPLAY" | awk '{print $1}')

# Check if display is connected
if [ -z $EXTERNAL_DISPLAY ]; then
	# Uncomment if add notification daemon
	#notify-send "No display connected"
	exit 1
fi

mirror_command = xrandr --output "$EXTERNAL_DISPLAY" --same-as "$PRIMARY_DISPLAY"
right_command = xrandr --output "$PRIMARY_DISPLAY" --auto --output "EXTERNAL_DISPLAY" --auto --right-of "$PRIMARY_DISPLAY"
left_command = xrandr --output "$PRIMARY_DISPLAY" --auto --output "EXTERNAL_DISPLAY" --auto --left-of "$PRIMARY_DISPLAY"

# you can customise the rofi command all you want ...
rofi_command="rofi -width 10 -hide-scrollbar -bg #586e75 -opacity 100 -padding 5"

options=$'mirror\nleft\nright' 

eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
