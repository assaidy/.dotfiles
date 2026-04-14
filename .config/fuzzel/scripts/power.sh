#!/bin/env bash

options=$(cat <<EOF
🚪 logout
💤 suspend
🔌 poweroff
🔄 reboot
EOF)
# 🔒 lockscreen

chosen=$(echo "$options" | fuzzel -d --minimal-lines | awk '{print $2}')

case "$chosen" in
  "logout")     kill -9 -1 ;;
  # "lockscreen") hyprlock ;;
  "suspend")    systemctl suspend ;;
  "poweroff")   systemctl poweroff ;;
  "reboot")     systemctl reboot ;;
  *)            exit 1 ;;
esac
