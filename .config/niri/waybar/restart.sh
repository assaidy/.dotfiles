#!/bin/sh

killall waybar
waybar -c "$HOME"/.config/niri/waybar/config.json -s "$HOME"/.config/niri/waybar/style.css &
