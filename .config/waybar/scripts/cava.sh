#!/usr/bin/env bash

cava -p /home/clevex/.config/cava/config | while read -r line; do
  output=""

  for ((i = 0; i < ${#line}; i++)); do
    char="${line:$i:1}"

    case "$char" in
    0) bar=" " ;;
    1) bar="▁" ;;
    2) bar="▂" ;;
    3) bar="▃" ;;
    4) bar="▄" ;;
    5) bar="▅" ;;
    6) bar="▆" ;;
    7) bar="▇" ;;
    8) bar="█" ;;
    9) bar="█" ;;
    \;) continue ;;
    *) bar=" " ;;
    esac

    output="$output$bar"
  done

  printf "%s\n" "$output" || break
done
