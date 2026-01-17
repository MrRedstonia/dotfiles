#!/bin/bash

# Kill any existing instances first
pkill -f "python3 .*/(shutdown|reboot|bios).py"

case "$1" in
    shutdown) python3 ~/.config/hypr/scripts/shutdown.py ;;
    reboot)   python3 ~/.config/hypr/scripts/reboot.py   ;;
    bios)     python3 ~/.config/hypr/scripts/bios.py     ;;
    quit)     exit 0 ;;
esac
