#!/bin/bash

killall waybar
waybar -c $HOME/.config/hypr/waybar/config.json &
