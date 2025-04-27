#!/bin/bash

OUTPUT_DIR=$HOME/Pictures/Screenshots/screenshot_$(date +%Y_%m_%d_%s).png

case $1 in
full)
    grim $OUTPUT_DIR
    ;;
area)
    grim -g "$(slurp)" $OUTPUT_DIR
    ;;
*)
    echo "Usage: $0 {full|area}"
    exit 1
    ;;
esac

notify-send -i $OUTPUT_DIR "Screenshot Taken" "Saved to $OUTPUT_DIR"

wl-copy < $OUTPUT_DIR
