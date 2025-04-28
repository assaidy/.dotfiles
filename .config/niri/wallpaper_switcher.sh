#!/bin/bash

# search processes with this script's name,
# and exculed (grep -v) the current process ID, so it doesn't match itself.
if pgrep -f "$0" | grep -v "$$" >/dev/null; then
    echo "Another instance of this script is already running. Exiting."
    exit 1
fi

WALL_DIR="$1"

if [[ -z "$WALL_DIR" ]]; then
    echo "Missing arg for wallpapers dir."
    exit 1
fi

while true; do
    wall=$(find "$WALL_DIR" -type f | shuf -n 1)
    if [[ -n "$wall" ]]; then
        swww img "$wall" --transition-type any
    else
        echo "No wallpapers found in $WALL_DIR."
    fi
    sleep 600 # in seconds
done
