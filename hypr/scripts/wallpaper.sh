#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Documents/Pictures/Wallpapers"
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f))

if [ "${#WALLPAPERS[@]}" -eq 0 ]; then
  echo "No wallpapers found in ${WALLPAPER_DIR}"
  exit 1
elif [ ${#WALLPAPERS[@]} -eq 1 ]; then
  WALLPAPER="${WALLPAPERS[0]}"
else
  CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded) # Get a random wallpaper that is not current one
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)
fi

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
