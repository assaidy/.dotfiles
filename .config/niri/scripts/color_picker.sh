#!/bin/env bash

set -e

geometry=$(slurp -p)

if [[ -z "$geometry" ]]; then
    exit 1
fi

color=$(grim -g "$geometry" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | awk '{print $3}')

echo "$color" | wl-copy

notify-send "Color picked" "$(wl-paste)"
