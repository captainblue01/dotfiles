-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("dunst")
  hl.exec_cmd("nextcloud")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("steam -silent")
  hl.exec_cmd("slimbookbattery --minimize")
end)
