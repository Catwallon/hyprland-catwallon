#!/bin/sh

LOW_BATTERY_LEVEL=20
CRITICAL_BATTERY_LEVEL=5

LOW_BATTERY_ICON=/usr/share/icons/breeze-dark/status/32/battery-010.svg
CRITICAL_BATTERY_ICON=/usr/share/icons/breeze-dark/status/32/battery-000.svg

low_notified=false
critical_notified=false

while true; do
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_LEVEL" ] && [ "$BATTERY_LEVEL" -gt "$CRITICAL_BATTERY_LEVEL" ]; then
        if [ "$low_notified" = false ]; then
            dunstify -u normal -i "$LOW_BATTERY_ICON" "Low battery" "Battery at $BATTERY_LEVEL%"
            low_notified=true
        fi
        critical_notified=false
    else
        low_notified=false
    fi

    if [ "$BATTERY_LEVEL" -le "$CRITICAL_BATTERY_LEVEL" ]; then
        if [ "$critical_notified" = false ]; then
            dunstify -u critical -i "$CRITICAL_BATTERY_ICON" "Critical battery" "Battery at $BATTERY_LEVEL%"
            critical_notified=true
        fi
    else
        critical_notified=false
    fi

    sleep 60
done
