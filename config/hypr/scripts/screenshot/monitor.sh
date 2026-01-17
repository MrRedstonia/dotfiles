#!/bin/bash

#######################
### MONITOR CAPTURE ###
#######################

DIR="$HOME/Pictures/Screenshots/$(date +%Y)"
mkdir -p "$DIR"

BASE_FILENAME="$(date +%d-%m_%H.%M)"
EXTENSION=".png"
FILENAME="$BASE_FILENAME$EXTENSION"
COUNTER=1

while [ -f "$DIR/$FILENAME" ]; do
    FILENAME="$BASE_FILENAME ($COUNTER)$EXTENSION"
    COUNTER=$((COUNTER + 1))
done

FULL_PATH="$DIR/$FILENAME"

ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

if [ -z "$ACTIVE_MONITOR" ]; then
    exit 0
fi

grim -o "$ACTIVE_MONITOR" "$FULL_PATH"

if [ -s "$FULL_PATH" ]; then
    wl-copy < "$FULL_PATH"

    ACTION=$(notify-send \
        --action="default=Open" \
        --hint=string:image-path:"$FULL_PATH" \
        --hint=int:transient:1 \
        --wait \
        "Screenshot Captured" \
        "$FULL_PATH")

    if [ "$ACTION" == "default" ]; then
        gwenview "$FULL_PATH"
    fi
else
    [ -f "$FULL_PATH" ] && rm "$FULL_PATH"
fi
