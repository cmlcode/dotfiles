#!/bin/bash

# Get volume and mute status
read -r _ vol mute <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol_percent=$(awk "BEGIN { printf \"%d\", $vol * 100 }")

# Choose icon
if [[ "$mute" == "[MUTED]" ]]; then
    icon="󰝟 "
else
    if (( vol_percent >= 66 )); then
        icon="󰕾 "
    elif (( vol_percent >= 33 )); then
        icon="󰖀 "
    else
        icon="󰕿 "
    fi
fi

# Output JSON with text and icon
echo "{\"text\": \"$icon $vol_percent%\"}"
