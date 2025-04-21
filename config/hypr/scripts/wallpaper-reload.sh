#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/desktopwallpapers/"
MONITORS=($(hyprctl monitors -j | jq -r '.[].name'))
USED_WALLPAPERS=()

# Function to get a random wallpaper not already used
get_random_wallpaper() {
    local wp
    while true; do
        wp=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
        if [[ ! " ${USED_WALLPAPERS[@]} " =~ " ${wp} " ]]; then
            USED_WALLPAPERS+=("$wp")
            echo "$wp"
            return
        fi
    done
}

# Clear previous wallpapers
hyprctl hyprpaper unload all

# Set random wallpaper for each monitor
for monitor in "${MONITORS[@]}"; do
    wp=$(get_random_wallpaper)
    hyprctl hyprpaper preload "$wp"
    hyprctl hyprpaper wallpaper "$monitor,$wp"
done
