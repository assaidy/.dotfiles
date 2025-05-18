#!/bin/bash

options="logout suspend lockscreen poweroff reboot"
chosen=$(echo "$options" | tr ' ' '\n' | fuzzel -d)

case "$chosen" in
    logout) kill -9 -1 ;;
    lockscreen) hyprlock ;;
    suspend) systemctl suspend ;;
    poweroff) systemctl poweroff ;;
    reboot) systemctl reboot ;;
esac
