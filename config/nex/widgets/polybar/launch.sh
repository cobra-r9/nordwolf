#!/bin/bash

polybar -c ~/.config/nex/widgets/polybar/config.ini main >/dev/null 2>&1 &

# enable only the main line for now.
echo "on" >/tmp/polyline.main.state

# disable the status line and enable it in lazy mode (first toggle of polyline )
echo "disabled" >/tmp/polyline.status.state
