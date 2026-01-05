#!/bin/bash
kanshi &
wl-paste --watch cliphist store &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
nextcloud --background &
slimbookbattery --minimize &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=qtile
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
systemctl --user start wireplumber
