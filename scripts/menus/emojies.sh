#!/bin/env bash

menu=$(jq -r '.emojis[] | "\(.emoji) \(.name)"' ~/.local/share/emoji_list.json)

selected=$(jq -r '.emojis[] | "\(.emoji) \(.name)"' ~/.local/share/emoji_list.json | fuzzel -d)
[[ -z "$selected" ]] && exit 1
if ! grep -Fxq "$selected" <<< "$menu"; then
    notify-send "⚠️ Invalid selection" "Not an emoji from the list"
    exit 1
fi

emoji=$(awk '{print $1}' <<< "$selected")
name=$(cut -d' ' -f2- <<< "$selected")

echo -n "$emoji" | wl-copy
notify-send "$emoji  $name" "Copied to clipboard"
