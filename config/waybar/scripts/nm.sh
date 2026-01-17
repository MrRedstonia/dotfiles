#!/bin/bash

# get NetworkManager status
status=$(nmcli -t -f WIFI g)

if [[ "$status" == "enabled" ]]; then
    # check if connected
    con=$(nmcli -t -f NAME c show --active | grep -v '^$')
    if [[ -n "$con" ]]; then
        echo ""  # connected Wi-Fi icon
    else
        echo "󰤮"  # disconnected Wi-Fi icon
    fi
else
    echo "睊"  # Wi-Fi off
fi
