#!/bin/sh

STATE_FILE="/tmp/waybar-music-hidden"

if [ -f "$STATE_FILE" ]; then
    echo ""
else
    playerctl metadata --format "{{artist}} - {{title}}" 2>/dev/null
fi
