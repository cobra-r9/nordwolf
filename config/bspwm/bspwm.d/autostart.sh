#!/bin/bash

BSPDIR="$HOME/.config/bspwm"
export PATH="${PATH}:$BSPDIR/src"

# ── Source all config atoms ───────────────────────────────────────────────────
source "$BSPDIR/bspwm.d/sources/services.sh"
source "$BSPDIR/bspwm.d/sources/wallpaper.sh"
source "$BSPDIR/bspwm.d/sources/widget.sh"
source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

systemctl --user import-environment QT_QPA_PLATFORMTHEME QT_STYLE_OVERRIDE
# ── Kill existing instances ───────────────────────────────────────────────────
killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager \
    bspc polybar quickshell qs snapserver picom tor vicinae plank

# ── Polkit agent ──────────────────────────────────────────────────────────────
[[ ! $(pidof xfce-polkit) ]] && /usr/lib/xfce-polkit/xfce-polkit &

# ── Keybindings ───────────────────────────────────────────────────────────────
sxhkd -c "$BSPDIR/bspwm.d/sxhkdrc" &

# ── Super key ─────────────────────────────────────────────────────────────────
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# ── Cursor ────────────────────────────────────────────────────────────────────
xsetroot -cursor_name left_ptr

# ── Picom ─────────────────────────────────────────────────────────────────────
[[ $is_svc_picom == true ]] && "$BSPDIR/bspwm.d/picomrc" &

# ── MPD ───────────────────────────────────────────────────────────────────────
[[ $is_svc_mpd == true ]] && systemctl --user start mpd &

# ── Wallpaper ─────────────────────────────────────────────────────────────────
feh --bg-fill "$wall_wallpaper"

pkill kdeconnectd
if [[ $is_svc_kdeconnectd == true ]]; then
    kdeconnectd &
fi

# ── Vicinae ───────────────────────────────────────────────────────────────────
pkill vicinae
if [[ $is_svc_vicinae == true ]]; then
    vicinae server &
fi

[[ $is_svc_dunst == true ]] && dunst &

# ── Bspfloat ──────────────────────────────────────────────────────────────────
bspfloat &

# ── Widget bars ────────────────────────────────────────────────────────────────
# No bars. just terminals. lol
[[ $is_widget == true ]] && polybar -c "$BSPDIR/widgets/polybar/config.ini" main
##---------------------------------------- Manager Scripts : All those use bspc subscribe to bring about some action----------------------------
