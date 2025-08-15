#!/usr/bin/env bash

sleep 1
echo date >> "${HOME}/test"

WALLPAPER_DIR="/home/cml/Documents/Pictures/Wallpapers"
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f))

echo "Wallpaper search" >> "${HOME}/test"

if [ "${#WALLPAPERS[@]}" -eq 0 ]; then
  echo "No wallpapers found in ${WALLPAPER_DIR}" >> ${HOME}/test.txt
  exit 1
elif [ ${#WALLPAPERS[@]} -eq 1 ]; then
  WALLPAPER="${WALLPAPERS[0]}"
else
  CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded) # Get a random wallpaper that is not current one
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALLPAPER")" | shuf -n 1)
fi

echo "Wallpaper set" >> "${HOME}/test"
# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
echo "Wallpaper reload" >> "${HOME}/test"
