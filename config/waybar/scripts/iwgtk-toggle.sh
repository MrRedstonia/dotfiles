#!/usr/bin/env bash

if pgrep -x iwgtk > /dev/null; then
    pkill -x iwgtk
else
    pkill -x pavucontrol 2>/dev/null
    iwgtk &
fi
