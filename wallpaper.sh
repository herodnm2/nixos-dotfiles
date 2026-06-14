#!/usr/bin/env bash

set -e

DIR="$HOME/wallpapers"

CHOICE=$(for img in "$DIR"/*; do
  echo -en "$(basename "$img")\x00icon\x1f$img\n"
done | rofi -dmenu -i -show-icons -theme ~/.config/rofi/wallpaper.rasi)

if [ -n "$CHOICE" ]; then
  WALL="$DIR/$CHOICE"

  echo "Selected: $WALL"

  # Wallpaper
  awww img "$WALL" --transition-type fade

  # Matugen
  matugen image "$WALL" \
    --source-color-index 0 \
    -t scheme-tonal-spot

  # Pywal cache for Pywalfox
  if command -v wal >/dev/null 2>&1; then
    wal -i "$WALL" -n -s -e -q
  fi
  # Swaync
  if command -v swaync-client >/dev/null 2>&1; then
    swaync-client -rs
  fi
  # Firefox theme update
  if command -v pywalfox >/dev/null 2>&1; then
    pywalfox update || true
  fi

  PRIMARY=$(grep '@define-color primary' ~/.cache/waybar/colors.css |
    awk '{print $3}' | tr -d ';')

  BACKGROUND=$(grep '@define-color background' ~/.cache/waybar/colors.css |
    awk '{print $3}' | tr -d ';')

  # MangoWM focus color
  if [ -n "$PRIMARY" ] && [ -n "$BACKGROUND" ]; then

    P="${PRIMARY#\#}"
    BGHEX="${BACKGROUND#\#}"

    PR=$((16#${P:0:2}))
    PG=$((16#${P:2:2}))
    PB=$((16#${P:4:2}))

    BR=$((16#${BGHEX:0:2}))
    BG=$((16#${BGHEX:2:2}))
    BB=$((16#${BGHEX:4:2}))

    # 35% primary + 65% background
    R=$(((PR * 35 + BR * 65) / 100))
    G=$(((PG * 35 + BG * 65) / 100))
    B=$(((PB * 35 + BB * 65) / 100))

    MANGO_COLOR=$(printf "0x%02x%02x%02xff" "$R" "$G" "$B")

    sed -i \
      "s/^focuscolor=.*/focuscolor=$MANGO_COLOR/" \
      "$HOME/.config/mango/config.conf"

    mmsg dispatch reload_config

    echo "Focus color -> $MANGO_COLOR"
  fi

  if [ -n "$PRIMARY" ]; then
    (
      find "$HOME/.icons/Colloid-Dark/places" \
        -type f \
        -name "*.svg" | while read -r icon; do

        sed -Ei \
          "s/fill=\"#([A-Fa-f0-9]{6})\"/fill=\"$PRIMARY\"/g" \
          "$icon"

      done

      rm -f "$HOME/.icons/Colloid-Dark/icon-theme.cache" 2>/dev/null || true

      pkill thunar 2>/dev/null || true

      echo "Icons recolored"
    ) &
  fi

fi
