#!/bin/bash

killall waybar
waybar -c $HOME/.config/hypr/waybar/config.json -s $HOME/.config/hypr/waybar/style.css &
