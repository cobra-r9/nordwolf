#!/bin/bash

result="$(nexl query -T -d | jq)"
layout="$(echo $result | jq -r '.layout')"
layout_variant="$(echo $result | jq -r '.layoutVariant')"

case "$layout" in
"binary")
    echo "󰕮 bsp"
    ;;
"monocle")
    echo "󰆧 mon"
    ;;
"tall")
    echo "󰕲 tall"
    ;;
"wide")
    echo "󰕯 wide"
    ;;
*)
    echo ""
    ;;
esac
