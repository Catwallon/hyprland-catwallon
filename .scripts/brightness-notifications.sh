#!/bin/sh

LOW_ICON=/usr/share/icons/breeze-dark/actions/24/brightness-low.svg 
HIGH_ICON=/usr/share/icons/breeze-dark/actions/24/brightness-high.svg 

brightness=$(brightnessctl | grep -oP '(?<=\()[0-9]+(?=%\))')

if [ "$brightness" -le 50 ]; then
    icon=$LOW_ICON
else
    icon=$HIGH_ICON
fi

if [ -d "/sys/class/backlight" ]; then
	dunstify -r 999 -i "$icon" -t 1000 "$brightness%"
fi
