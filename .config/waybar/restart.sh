#!/bin/sh

killall waybar
waybar -c ~/.config/waybar/config-hypr.json &
