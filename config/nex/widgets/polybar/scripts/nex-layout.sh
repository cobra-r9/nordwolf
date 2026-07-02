#!/bin/bash

result="$(nexl query -T -d | jq)"
layout="$(echo $result | jq -r '.layout')"
layout_variant="$(echo $result | jq -r '.layoutVariant')"

echo "$layout"
echo "$layout_variant"

case "$layout" in
"binary")
    echo "󰕮"
    ;;
"monocle")
    echo "󰆧"
    ;;
"tall")
    echo "󰕲"
    ;;
"wide")
    echo "󰕯"
    ;;
*)
    echo ""
    ;;
esac
