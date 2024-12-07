#!/bin/sh

LOW_BATTERY_LEVEL=20
CRITICAL_BATTERY_LEVEL=5

LOW_BATTERY_ICON=/usr/share/icons/breeze-dark/status/32/battery-010.svg
CRITICAL_BATTERY_ICON=/usr/share/icons/breeze-dark/status/32/battery-000.svg
CHARGING_ICON=/usr/share/icons/breeze-dark/preferences/32/preferences-desktop-thunderbolt.svg

low_notified=false
critical_notified=false
charging_notified=false

if [ -d "/sys/class/power_supply/BAT0" ]; then
		while true; do
			BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
			CHARGING=$(acpi -b | grep -q "Charging" && echo true || echo false)

			if [ "$CHARGING" = true ]; then
				if [ "$charging_notified" = false ]; then
					dunstify -r 999 -u normal -i "$CHARGING_ICON" "Charging" "Power adapter plugged"
					low_notified=false
					critical_notified=false
					charging_notified=true
				fi
			else
				charging_notified=false

				if [ "$BATTERY_LEVEL" -le "$CRITICAL_BATTERY_LEVEL" ] && [ "$critical_notified" = false ]; then
					dunstify -r 999 -u critical -i "$CRITICAL_BATTERY_ICON" "Critical battery" "Battery at $BATTERY_LEVEL%"
					critical_notified=true
				elif [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_LEVEL" ] && [ "$critical_notified" = false ] && [ "$low_notified" = false ]; then
					dunstify -r 999 -u normal -i "$LOW_BATTERY_ICON" "Low battery" "Battery at $BATTERY_LEVEL%"
					low_notified=true
				fi

				if [ "$BATTERY_LEVEL" -gt "$LOW_BATTERY_LEVEL" ]; then
					low_notified=false
					critical_notified=false
				fi
			fi

			sleep 1
		done
fi
