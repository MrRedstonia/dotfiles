#!/bin/bash

# Function to check Mullvad status
check_mullvad() {
    ip link show mullvad 2>/dev/null | grep -c "state UNKNOWN"
}

# Handle click actions
if [[ "$1" == "toggle" ]]; then
    if [[ $(check_mullvad) -gt 0 ]]; then
        sudo resolvconf -u 2>/dev/null
        sudo wg-quick down mullvad
	sudo systemctl restart NetworkManager
    else
        sudo resolvconf -u 2>/dev/null
        sudo wg-quick up mullvad
    fi
fi

# Re-check after any action
is_mullvad_up=$(check_mullvad)

# Output JSON for Waybar
if [[ $is_mullvad_up -gt 0 ]]; then
    echo "{\"text\":\"\",\"tooltip\":\"VPN: Connected\"}"
else
    echo "{\"text\":\"\",\"tooltip\":\"VPN: Disconnected\"}"
fi
