#!/bin/bash

# --- CPU Power State: Force minimum frequency governor ---
sudo /usr/bin/cpupower frequency-set -g powersave

# --- GPU Power State: Force lowest clock state (low) ---
echo low | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level
