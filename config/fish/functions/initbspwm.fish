function initbspwm
    echo bspwm >~/.xinitrc
    exec startx 1>~/.startx.log 2>&1
end
