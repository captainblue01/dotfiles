#!/bin/bash

# This script checks if any window is fullscreen in Hyprland

# Get the active window details
active_window=$(hyprctl activewindow -j)

# Check if "fullscreen" is true
if echo "$active_window" | grep -q '"fullscreen": 1'; then
    echo '{"text": "󰊓", "class": "fullscreen"}'
else
    echo '{"text": "󰾍", "class": "not-fullscreen"}'
fi
