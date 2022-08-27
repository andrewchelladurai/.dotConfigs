#! /bin/bash

#
# This script sets the variables used for configuring the environment and tools.
#

# https://wiki.archlinux.org/title/java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing
# Avoid gray Java windows under tiling managers
export _JAVA_AWT_WM_NONREPARENTING=1

#
# Base Variables
#
export ACTIVE_MONITOR_WIDTH=$(xrandr --listactivemonitors | grep -v Monitors | cut -d " " -f 4 | cut -d"/" -f 1)
export ACTIVE_MONITOR_HEIGHT=$(xrandr --listactivemonitors | grep -v Monitors | cut -d "x" -f 2 | cut -d"/" -f 1)
# Padding used on the monitor content
export CONTENT_PADDING=13

# BSPWM variables
export BSPWM_GAP=3
export BSPWM_PAD=$CONTENT_PADDING
export BSPWM_BORDER=$BSPWM_GAP
export BSPWM_SPLIT_RATIO=0.53
export BSPWM=

# POLYBAR variables 
export POLYBAR_WIDTH=$(echo $ACTIVE_MONITOR_WIDTH-$BSPWM_PAD*2 | bc)
export POLYBAR_HEIGHT=$(echo $CONTENT_PADDING*2+4 | bc)
export POLYBAR_OFFSET_X=$CONTENT_PADDING
export POLYBAR_OFFSET_Y=$CONTENT_PADDING
export POLYBAR_RADIUS=0
export POLYBAR_PAD_RIGHT=0
export POLYBAR_PAD_LEFT=0
export POLYBAR_MODULE_MARGIN=0
export POLYBAR_BORDER=0

