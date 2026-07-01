#!/bin/bash

state="$(pomoc status state 2>/dev/null)"

[[ "$state" == "idle" ]] && echo "󱎫"
[[ "$state" == "running" ]] && echo "󰥔"
[[ "$state" == "paused" ]] && echo "󰥕"
[[ "$state" == "break" ]] && echo "󰔟"
[[ ! "$state" ]] && echo ""
