#!/bin/bash

result=$(pomoc status time 2>/dev/null)
if [[ ! "$result" ]]; then
    echo ""
else
    echo "$result" | grep -qP "^\d{2}\d{2}\d{2}" &&
        echo "$result" | sed 's/\([0-9]*\):\([0-9]*\):\([0-9]*\)/\1h \2m \3s/' ||
        echo "$result" | sed 's/\([0-9]*\):\([0-9]*\)/\1m \2s/'

    if [[ "$result" == "00:00" || "$result" = "00:00:00" ]]; then
        notify-send "Pomodoro Client" "Your $(pomoc status active) period has end." -u "critical" -t "5000" &
        timeout 5 paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &
    fi
fi
