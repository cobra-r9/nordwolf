#!/bin/bash

################################# Declare Variables #####################################
#-----------------------------------Web Apps---------------------------------------------
declare -a code=(
    Geany
    code-oss
)

#------------------------------Office Apps-----------------------------------------------
declare -a office=(
    libreoffice-writer
    libreoffice-calc
    libreoffice-impress
    libreoffice-startcenter
    libreoffice
    Soffice
    *:libreofficedev
    *:soffice
)

#-------------------------------Media Apps-----------------------------------------------
declare -a media=(
    Audacity
    Music
    MPlayer
    Lxmusic
    Inkscape
    Gimp-2.10
    obs
)

#-------------------------------system settings------------------------------------------
declare -a settings=(
    Lxappearance
    Lxtask
    Lxrandr
    nex-settings
    Arandr
    System-config-printer.py
    Pavucontrol Exo-helper-1
    Xfce4-power-manager-settings
)

#----------------------------always floating apps----------------------------------------
declare -a floating=(
    alacritty-float
    kitty-float
    Pcmanfm
    Onboard
    Yad
    'Firefox:Places'
    Viewnior
    feh
    Nm-connection-editor
    calamares
    Calamares
    nex-settings
    scrcpy
)

################################## nexl rules ###########################################
## Manage all the unmanaged windows remaining from a previous session.
nexl wm --adopt-orphans

## remove all rules first
nexl rule -r *:*

#------------------------------ Define Window Specific Applications----------------------

# Open desktop in workspace 1
# You can add something here, like the for looped declarative aproach!

# Open web apps in workspace 2
nexl rule -a firefox desktop='^2' follow=on focus=on
nexl rule -a chromium desktop='^2' follow=on focus=on

# Open code apps in workspace 3
for i in ${code[@]}; do
    nexl rule -a $i desktop='^3' follow=on focus=on
done

# Open office apps in workspace 4
for i in ${office[@]}; do
    nexl rule -a $i desktop='^4' follow=on focus=on
done

# Open media apps in workspace 5
for i in ${media[@]}; do
    nexl rule -a $i desktop='^5' state=floating follow=on focus=on
done

for i in ${settings[@]}; do
    nexl rule -a $i desktop='^6' state=floating follow=on focus=on
done

# Always floating apps
for i in ${floating[@]}; do
    nexl rule -a $i state=floating follow=on focus=on
done

############################# vicinae, toml-gui position, etc #######################################

nexl rule -a vicinae state=floating follow=on focus=on rectangle=770x480+298+292
nexl rule -a command state=floating follow=on focus=on rectangle=770x480+298+292

############################## General Rules #########################################

nexl rule -a stalonetray state=floating manage=off
nexl rule -a '' name=quickshell state=floating layer=above sticky=on focusable=off border=off

############################ External Rules ##########################################

# if you have any, then place them @ exter_rules dir and run from there.
