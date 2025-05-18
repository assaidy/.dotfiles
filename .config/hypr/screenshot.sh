#!/bin/bash

set -e

OUTPUT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$OUTPUT_DIR"

OUTPUT_PATH="$OUTPUT_DIR/screenshot_$(date +%Y_%m_%d_%s).png"

case "$1" in
full)
    grim "$OUTPUT_PATH"
    ;;
area)
    geometry=$(slurp)
    if [[ -z "$geometry" ]]; then
	echo "No area is selected"
	exit 1
    fi 
    grim -g "$geometry" "$OUTPUT_PATH"
    ;;
*)
    echo "Usage: $0 {full|area}"
    exit 1
    ;;
esac

notify-send -i "$OUTPUT_PATH" "Screenshot Taken" "Saved to $OUTPUT_PATH"

wl-copy < "$OUTPUT_PATH"
