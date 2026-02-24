#!/bin/env bash

if ! exec 200>/tmp/wallpaper_switcher.lock; then
  echo "Failed to open lock file."
  exit 1
fi

if ! flock -n 200; then
  echo "Another instance of this script is already running. Exiting."
  exit 1
fi

WALL_DIR="${1:-}"
if [[ -z "$WALL_DIR" ]]; then
  echo "Missing arg for wallpapers dir."
  exit 1
fi

while true; do
  WALL=$(find "$WALL_DIR" -type f | shuf -n 1)
  if [[ -n "$WALL" ]]; then
    swww img "$WALL" --transition-type any
    # a blurred version as a background for lock screen and niri overview
    BLURRED="/tmp/blurred_wallpaper.jpg"
    magick "$WALL" -blur 0x16 "$BLURRED"
    if [[ "$XDG_CURRENT_DESKTOP" = "niri" ]]; then
      pkill swaybg 2>/dev/null
      swaybg -i "$BLURRED" -m fill &
    fi
  else
    echo "No wallpapers found in $WALL_DIR."
  fi
  sleep 60
done
