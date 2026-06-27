#!/bin/bash

active="$(pomoc status active)"

if [[ "$active" == "idle" || "$(cat /tmp/polyline.pomoc.state)" == "pause" ]]; then
    pomoc start
    echo "focus" >/tmp/polyline.pomoc.state
elif [[ "$(cat /tmp/polyline.pomoc.state)" == "focus" ]]; then
    pomoc pause
    echo "pause" >/tmp/polyline.pomoc.state
fi

[[ "$active" == "break" ]] && echo "break" >/tmp/polyline.pomoc.state
