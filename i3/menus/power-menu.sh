#!/bin/bash

shutdown_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="i3-msg exit"

# you can customise the rofi command all you want ...
rofi_command="rofi -width 10 -hide-scrollbar -bg #586e75 -opacity 100 -padding 5"

options=$'shutdown\nreboot\nlogout' 

eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
