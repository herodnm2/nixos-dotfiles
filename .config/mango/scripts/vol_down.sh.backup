#!/bin/bash
pamixer -d 5
vol=$(pamixer --get-volume)
notify-send "Volume" "$vol%" -h int:value:$vol
