#! /bin/bash

#
# This script sets the variables used for configuring the environment and tools.
#

# https://wiki.archlinux.org/title/java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing
# Avoid gray Java windows under tiling managers
export _JAVA_AWT_WM_NONREPARENTING=1

export ACTIVE_MONITOR_WIDTH=$(xrandr --listactivemonitors | grep -v Monitors | cut -d " " -f 4 | cut -d"/" -f 1)
export ACTIVE_MONITOR_HEIGHT=$(xrandr --listactivemonitors | grep -v Monitors | cut -d "x" -f 2 | cut -d"/" -f 1)

# POLYBAR variables 
export POLYBAR_WIDTH="98%"
export POLYBAR_HEIGHT="33"
export POLYBAR_OFFSET_X="1%"
export POLYBAR_OFFSET_Y="1%"
export POLYBAR_RADIUS="0"
export POLYBAR_PAD_RIGHT="0"
export POLYBAR_PAD_LEFT="0"
export POLYBAR_MODULE_MARGIN="0"
export POLYBAR_BORDER="0"

# BSPWM variables
export BSPWM_GAP=1
export BSPWM_PAD=13
export BSPWM_BORDER=0
export BSPWM=
export BSPWM=
export BSPWM=
export BSPWM=
export BSPWM=


