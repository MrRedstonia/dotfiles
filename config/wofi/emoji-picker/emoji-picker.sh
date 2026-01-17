#!/bin/bash

EMOJI_DIR="$HOME/.config/wofi/emoji-picker/emojis"
STATE_FILE="/tmp/emoji_picker_current"
PREF_FILE="$HOME/.config/wofi/emoji-kpicker/last_tone"

if [ -n "$1" ]; then
    TONE=$1
else
    TONE=$(cat "$PREF_FILE" 2>/dev/null || echo 0)
fi

echo "$TONE" > "$STATE_FILE"
echo "$TONE" > "$PREF_FILE"

case "$TONE" in
    1) FILE="emojis-tone-1.txt"; ICON="🏻" ;;
    2) FILE="emojis-tone-2.txt"; ICON="🏼" ;;
    3) FILE="emojis-tone-3.txt"; ICON="🏽" ;;
    4) FILE="emojis-tone-4.txt"; ICON="🏾" ;;
    5) FILE="emojis-tone-5.txt"; ICON="🏿" ;;
    *) FILE="emojis.txt";;
esac

SPACES=$(printf '%*s' 190 '')

pkill wofi
selected_line=$(cat "$EMOJI_DIR/$FILE" | wofi -d -p "Search $SPACES $ICON" --hide-scroll)

if [ -n "$selected_line" ]; then
    hyprctl dispatch submap reset

emoji=$(echo "$selected_line" | awk -F':' '{print $1}' | tr -d ' ')

sleep 0.15
wtype "$emoji"

fi
