#!/bin/bash

case "$1" in
  up) pamixer -i 5 ;;
  down) pamixer -d 5 ;;
  mute) pamixer -t ;;
esac

vol=$(pamixer --get-volume)
notify-send "Volume" "$vol%" -h int:value:$vol
