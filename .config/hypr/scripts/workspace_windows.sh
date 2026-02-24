#!/bin/env bash

print_usage() {
  echo "usage:"
  echo "  $(basename $0)              # print current active workspace window count"
  echo "  $(basename $0) --daemon     # run in background, watch for changes and signal Waybar"
  echo "  $(basename $0) --hlep       # print this help message"
}

window_count_cmd() {
  hyprctl -j activeworkspace | jq ".windows"
}

case $1 in
  "")
    window_count_cmd
    ;;
  "--daemon")
    last_value=$(window_count_cmd)
    while sleep 0.200; do
      current_value=$(window_count_cmd)
      if [[ "$last_value" != "$current_value" ]]; then
        last_value="$current_value"
        pkill -RTMIN+1 waybar
      fi
    done
    ;;
  "--help")
    print_usage
    ;;
  *)
    echo "error: invalid argument: $1"
    print_usage
    exit 1
    ;;
esac
