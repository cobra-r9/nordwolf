function initnex
    echo nex >~/.xinitrc
    exec startx 1>~/.startx.log 2>&1
end
