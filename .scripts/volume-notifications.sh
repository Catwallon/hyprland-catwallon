#!/bin/sh

MUTED_ICON=/usr/share/icons/breeze-dark/status/24/audio-volume-muted.svg
LOW_ICON=/usr/share/icons/breeze-dark/status/24/audio-volume-low.svg
MEDIUM_ICON=/usr/share/icons/breeze-dark/status/24/audio-volume-medium.svg
HIGH_ICON=/usr/share/icons/breeze-dark/status/24/audio-volume-high.svg

volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(echo "$volume_info" | awk '{print int($2 * 100)}')
is_muted=$(echo "$volume_info" | grep -o '\[MUTED\]')

if [ -n "$is_muted" ]; then
    icon=$MUTED_ICON
elif [ "$volume" -le 30 ]; then
    icon=$LOW_ICON
elif [ "$volume" -le 70 ]; then
    icon=$MEDIUM_ICON
else
    icon=$HIGH_ICON
fi

dunstify -r 999 -i "$icon" -t 1000 "$volume%"
