#!/bin/bash

options="logout suspend lockscreen poweroff reboot"
chosen_option=$(echo $options | tr " " "\n" | fuzzel --config $HOME/.config/niri/fuzzel/fuzzel.ini -d)

case "$chosen_option" in
    logout) kill -9 -1 ;;
    lockscreen) hyprlock ;;
    suspend) systemctl suspend ;;
    poweroff) systemctl poweroff ;;
    reboot) systemctl reboot ;;
esac
