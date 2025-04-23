#!/bin/bash

# Get the current workspace ID
current_workspace_id=$(hyprctl activeworkspace -j | jq -r '.id')

# Prompt for new name using fuzzel
new_name=$(fuzzel --dmenu --prompt="Rename workspace $current_workspace_id to:" < /dev/null)

# If user canceled or input is empty, exit
if [ -z "$new_name" ]; then
  exit 0
fi

# Send the command to rename the workspace
hyprctl dispatch renameworkspace "$current_workspace_id $current_workspace_id:$new_name"
