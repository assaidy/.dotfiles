#!/bin/env bash

OUTPUT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$OUTPUT_DIR"

OUTPUT_PATH="$OUTPUT_DIR/screenshot_$(date +%Y_%m_%d_%s).png"

case "$1" in
  "full")
    grim -l 3 "$OUTPUT_PATH"
    ;;
  "area")
    geometry=$(slurp)
    if [[ -z "$geometry" ]]; then
      echo "No area is selected"
      exit 1
    fi 
    grim -l 3 -g "$geometry" "$OUTPUT_PATH"
    ;;
  *)
    echo "Usage: $0 {full|area}"
    exit 1
    ;;
esac

wl-copy < "$OUTPUT_PATH"
notify-send -i "$OUTPUT_PATH" "Screenshot captured" "You can paste the image from the clipboard."
