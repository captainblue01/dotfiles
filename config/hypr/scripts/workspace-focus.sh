#!/usr/bin/env bash

# Workaround for a Hyprland regression where on_current_monitor breaks
# workspace_back_and_forth toggling (already active workspace does nothing
# instead of switching back): https://github.com/hyprwm/Hyprland/discussions/14591
#
# Usage: workspace-focus.sh <workspace-number>

target="$1"
current=$(hyprctl activeworkspace | grep -oP '(?<=workspace ID )\d+')

if [[ "$current" == "$target" ]]; then
  hyprctl dispatch "hl.dsp.focus({ workspace = 'previous_per_monitor' })"
else
  hyprctl dispatch "hl.dsp.focus({ workspace = $target, on_current_monitor = true })"
fi
