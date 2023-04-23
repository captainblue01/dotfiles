from libqtile import hook
import os
import subprocess
import screen_manager
import key_bind_manager
import layout_manager
import group_manager
from libqtile import qtile

keys = key_bind_manager.create_keybinds()
widget_defaults = screen_manager.WIDGET_DEFAULTS
screens = screen_manager.ScreenManager().screens()
layouts = layout_manager.LAYOUTS
groups = group_manager.get_groups()
floating_layout = layout_manager.FLOATING_LAYOUTS

# Boolean Variables
auto_fullscreen = True
bring_front_click = True
cursor_warp = True
focus_on_window_activation = "smart"
follow_mouse_focus = False
reconfigure_screens = True
# If you have issues with steam games not minimizing set this to true
auto_minimize = False
dgroups_key_binder = None
dgroups_app_rules = []
wmname = "LG3D"  # This is false this is just to help with java UI tookits


# Autostart
# Runs the auto start script on system startup
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])


# Refresh system on screen change
@hook.subscribe.screen_change
def reload_screens(qtile):
    qtile.cmd_reload_config()
    home = os.path.expanduser("~/.config/qtile/refresh_system.sh")
    subprocess.call([home])


# Keeps floating windows on top
@hook.subscribe.focus_change
def float_to_front():
    for window in qtile.current_group.windows:
        if window.floating:
            window.cmd_bring_to_front()
