#!/bin/bash

# --- CPU Power Restore: Restore default performance governor ---
# The 'sudo' is still required for cpupower
sudo /usr/bin/cpupower frequency-set -g performance

# --- GPU Power Restore: Restore to auto using the full path ---

# 1. Restore to auto for dynamic scaling
# This is the standard file name expected by the driver.
echo auto | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level
