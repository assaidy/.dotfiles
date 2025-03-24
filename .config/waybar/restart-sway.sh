#!/bin/sh

killall waybar
waybar -c ~/.config/waybar/config-sway.json &
