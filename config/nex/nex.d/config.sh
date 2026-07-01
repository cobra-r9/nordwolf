#!/bin/bash

#set -Eeuo pipefail
#trap 'echo "[ERROR] line $LINENO: $BASH_COMMAND" >&2' ERR
############################## VARIABLES ####################################
# define the prefix path
# see in current directory

PTH="$HOME/.config/nex/nex.d"
SOURCEPTH="$PTH/sources"
############################### SOURCE ######################################

source "$SOURCEPTH/nex.sh"

############################## FUNCTIONS ####################################

# ── Borders ───────────────────────────────────────────────────────────────────

configure_border() {
    if [[ $is_nex_borders == true ]]; then
        nexl config border_width "$nex_borders_width"
        nexl config focused_border_color "$nex_borders_focused_color"
        nexl config normal_border_color "$nex_borders_normal_color"
        nexl config active_border_color "$nex_borders_active_color"
    else
        nexl config border_width 0
    fi
}

# ── Windows ───────────────────────────────────────────────────────────────────

configure_windows() {
    nexl config split_ratio "$nex_window_sr_ratio"
    nexl config window_gap "$nex_window_gapped_gap"
    nexl config top_padding "$nex_window_padded_top"
    nexl config bottom_padding "$nex_window_padded_bottom"
    nexl config left_padding "$nex_window_padded_left"
    nexl config right_padding "$nex_window_padded_right"

    if [[ $is_nex_presel == true ]]; then
        nexl config presel_feedback true
        nexl config presel_feedback_color "$nex_presel_pfc"
    else
        nexl config presel_feedback false
    fi
}

# ── Scheme ────────────────────────────────────────────────────────────────────

configure_scheme() {
    if [[ $is_nex_scheme_automatic == true ]]; then
        nexl config automatic_scheme "$nex_scheme_automatic_scheme"
        nexl config initial_polarity "$nex_scheme_automatic_initial_polarity"
    fi
}

# ── Monocle ───────────────────────────────────────────────────────────────────

configure_monocle() {
    nexl config borderless_monocle "$nex_monocle_borderless"
    nexl config gapless_monocle "$nex_monocle_gapless"
    nexl config single_monocle "$nex_monocle_single"
}

configure_prefix() {
    nexl config status_prefix "$nex_window_prefix"
}
# ── Dispatch ──────────────────────────────────────────────────────────────────

nexl_configure() {
    case ${1} in
    border) configure_border ;;
    windows) configure_windows ;;
    scheme) configure_scheme ;;
    monocle) configure_monocle ;;
    status_prefix) configure_prefix ;;
    esac
}

# ── Run ───────────────────────────────────────────────────────────────────────

############################# COMMAND #######################################
# By default, configure everything, make it modular and extensible
# Add focus essentials
nexl config focus_follows_pointer "true"
#nexl_configure border
#nexl_configure windows
#nexl_configure scheme
#nexl_configure status_prefix
#nexl_configure monocle
#check_source
### Want minimal?
### Just configure border and windows. enough...
