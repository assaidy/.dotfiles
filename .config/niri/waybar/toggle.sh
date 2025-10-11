#!/bin/env bash

if pgrep waybar > /dev/null; then
    killall waybar
else
    waybar -c $HOME/.config/niri/waybar/config.json -s $HOME/.config/niri/waybar/style_gruvbox.css &
fi
