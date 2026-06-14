#!/bin/sh

STATE_FILE="/tmp/waybar-music-hidden"

if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
else
    touch "$STATE_FILE"
fi

pkill -SIGRTMIN+8 waybar
