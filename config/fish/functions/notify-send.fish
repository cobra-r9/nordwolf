#!/bin/fish
function runc
    make -f "~/.Makefile-default" SRC="$argv[1]"
end
