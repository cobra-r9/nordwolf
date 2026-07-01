#!/bin/bash

# file : nex.sh
# function : sources the config.sh file, applies all the configs

##################################################### SOURCES ###########################################
# source the necessary import files...

source "$HOME/.config/nex/nex.d/sources/widget.sh"
source "$HOME/.config/nex/nex.d/sources/colors.sh"
##################################################### BORDERS ###########################################
# set the border colors
nex_borders_active_color=${active_color:-'#ffffff'}
nex_borders_focused_color=${focused_color:-'#ffffff'}
# border becomes white if something goes wrong
nex_borders_normal_color=${normal_color:-'#ffffff'}

# set the border style
nex_borders_style='solid'

# set the border width
nex_borders_width=2

##################################################### MONOCLE ############################################

nex_monocle_borderless=false
nex_monocle_gapless=false
nex_monocle_single=false

#################################################### PRESEL ##############################################

# setting the color for presel feedback
nex_presel_pfc=${pfc_color:-'#ffffff'}

# is nex having presel enabled? --> [ tip : see the BOOLEANS section...]

################################################### WINDOWS ##############################################

# set the window manager initial polarity and split scheme
nex_scheme_automatic_initial_polarity='second_child'
nex_scheme_automatic_scheme='spiral'

# set the window manager gap
nex_window_gapped_gap=10

# set additional window manager padding
nex_window_padded_bottom=0
nex_window_padded_left=0
nex_window_padded_right=0
nex_window_padded_top=0
# set the status prefix
nex_window_prefix=''

# define the split ratio
nex_window_sr_ratio=0.5

################################################### BOOLEANS ###############################################

# [ tip : define the booleans so that scripts can apply logic upon them ]

# is nex having borders?
is_nex_borders=true

# is nex showing presel feedback?
is_nex_presel=false

# is nex set to automatic scheme?
is_nex_scheme_automatic=true

# is nex have gaps between windows?
is_nex_window_gapped=true

# is there any additional padding?
is_nex_window_padded=false
