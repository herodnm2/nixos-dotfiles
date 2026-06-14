#!/bin/bash
pamixer -i 5
vol=$(pamixer --get-volume)
notify-send "Volume" "$vol%" -h int:value:$vol
