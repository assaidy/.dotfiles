#!/bin/env bash

EMOJIS_FILE="$HOME/.config/fuzzel/scripts/emoji_list.json"

menu=$(jq -r '.emojis[] | "\(.emoji) \(.name)"' "$EMOJIS_FILE")

selected=$(jq -r '.emojis[] | "\(.emoji) \(.name)"' "$EMOJIS_FILE" | fuzzel -d)
if [[ -z "$selected" ]]; then
  exit 1
fi

if ! grep -Fxq "$selected" <<< "$menu"; then
    notify-send "⚠️ Invalid selection" "Not an emoji from the list"
    exit 1
fi

emoji=$(awk '{print $1}' <<< "$selected")
name=$(cut -d' ' -f2- <<< "$selected")

echo -n "$emoji" | wl-copy
notify-send "$emoji  $name" "Copied to clipboard"
