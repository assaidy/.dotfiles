#!/bin/bash

geometry=$(slurp -p)

[[ $? -ne 0 ]] && exit 1

grim -g "$geometry" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | awk '{print $3}' | wl-copy

notify-send "Color picked" "$(wl-paste)"
