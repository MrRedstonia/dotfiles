#!/usr/bin/env bash

if pgrep -x pavucontrol > /dev/null; then
    pkill -x pavucontrol
else
    pkill -x iwgtk 2>/dev/null
    pavucontrol &
fi
