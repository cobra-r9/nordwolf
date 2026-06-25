#!/bin/bash

polybar -c ~/.config/bspwm/widgets/polybar/config.ini main &
echo "on" >/tmp/polyline.main.state
polybar -c ~/.config/bspwm/widgets/polybar/config.ini status &
sleep 0.5
bspc config bottom_padding 0
sleep 0.5
pgrep -a polybar | grep "status" | awk '{print $1}' | xargs -I {} polybar-msg -p {} cmd toggle
echo "off" >/tmp/polyline.status.state
