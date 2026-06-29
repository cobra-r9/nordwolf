#!/bin/bash

state="$(pomoc status state)"

[[ "$state" == "idle" ]] && echo "󱎫"
[[ "$state" == "running" ]] && echo "󰥔"
[[ "$state" == "paused" ]] && echo "󰥕"
[[ "$state" == "break" ]] && echo "󰔟"
