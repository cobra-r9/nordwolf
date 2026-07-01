#!/bin/bash

#set -Eeuo pipefail
#trap 'echo "[ERROR] line $LINENO: $BASH_COMMAND" >&2' ERR

##################################### MONITORS ##########################################
## Manage Monitors and Workspaces
## Default Setup (Set 8 workspaces on each monitor)

workspaces() {
	name=1
	for monitor in $(nexl query -M); do
		nexl monitor "$monitor" -d '1' '2' '3' '4' '5' '6'
		#nexl monitor ${monitor} -n "$name" -d '' '' '' '' '' ''
		(( name++ ))
	done
}


## Two Monitors Setup (Laptop and external monitor, set 4 workspaces on each monitor)
two_monitors_workspaces() {
	# change these values according to your system
	# you can use `xrandr -q` to get the names of monitors
	INTERNAL_MONITOR="eDP"
	EXTERNAL_MONITOR="HDMI-A-0"
	if [[ $(xrandr -q | grep "${EXTERNAL_MONITOR} connected") ]]; then
		nexl monitor "$EXTERNAL_MONITOR" -d '' '' '' ''
		nexl monitor "$INTERNAL_MONITOR" -d '' '' '' ''
		nexl wm -O "$EXTERNAL_MONITOR" "$INTERNAL_MONITOR"
	else
		nexl monitor "$INTERNAL_MONITOR" -d '' '' '' '' '' '' '' ''
	fi
}

## Three Monitors Setup (Laptop and two external monitor, 3-2-3 workspaces)
three_monitors_workspaces() {
	# again, change these values accordingly
	MONITOR_1="eDP"
	MONITOR_2="HDMI-A-0"
	MONITOR_3="HDMI-A-1"
	nexl monitor "$MONITOR_1" -d '' ''
	nexl monitor "$MONITOR_2" -d '' '' ''
	nexl monitor "$MONITOR_3" -d '' '' ''
	nexl wm -O "$MONITOR_2" "$MONITOR_1" "$MONITOR_3"
}

## Uncomment only one function according to your needs

## Apply these in nex configurations
