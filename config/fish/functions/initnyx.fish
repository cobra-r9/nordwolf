function initnyx
    echo ~/Workspace/c/nyxwm/build/bin/nyxwm >~/.xinitrc
    exec startx 1>~/.startx.log 2>&1
end
