#!/usr/bin/env bash

MONITOR_NAME="$WAYBAR_OUTPUT_NAME"
SOCKET="$XDG_RUNTIME_DIR/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock"

# Initial print
get_status() {
    ACTIVE=$(hyprctl monitors -j | jq -r '.[] | select(.focused).name')
    if [ "$MONITOR_NAME" = "$ACTIVE" ]; then
        echo '{"text":"◉", "class":"active"}'
    else
        echo '{"text":"◉", "class":"inactive"}'
    fi
}

get_status

# Listen to Hyprland events
socat - UNIX-CONNECT:"$SOCKET" | while read -r line; do
    if [[ "$line" == focusedmon* ]]; then
        get_status
    fi
done
