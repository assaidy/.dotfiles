#!/bin/env bash

# search processes with this script's name,
# and exculed (grep -v) the current process ID, so it doesn't match itself.
if pgrep -f "$0" | grep -v "$$" >/dev/null; then
    echo "Another instance of this script is already running. Exiting."
    exit 1
fi

WALL_DIR=$1
[[ -z "$WALL_DIR" ]] && echo "Missing arg for wallpapers dir." && exit 1
[[ ! -d "$WALL_DIR" ]] && echo "Direcotry doesn't exist." && exit 1

while true; do
    wall=$(fd --type=f . $WALL_DIR | shuf -n 1)
    if [[ -n "$wall" ]]; then
        swww img --resize=crop --transition-type=any "$wall"
    else
        echo "No wallpapers found in $WALL_DIR."
    fi
    sleep 60 # in seconds
done
