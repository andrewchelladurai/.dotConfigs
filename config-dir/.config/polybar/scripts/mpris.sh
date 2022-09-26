#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "喇 $(playerctl metadata title) $(playerctl metadata artist)"
elif [ "$player_status" = "Paused" ]; then
    echo " Paused"
else
    echo ""
fi

