import os
import random
import subprocess

import keymaps
import layouts_and_groups
import widgets
from libqtile import bar, hook, qtile
from libqtile.config import Screen


def get_wallpaper(folder):
    all_files = os.listdir(folder)
    random_image = random.choice(all_files)
    random_image_path = os.path.join(folder, random_image)
    return random_image_path


search_script = os.path.expanduser("~/.config/qtile/scripts/find_file")
tmux_browser = os.path.expanduser("~/.config/tmux/scripts/tmux-browser")
file_man = os.path.expanduser("~/.config/lf/lfrun")
desktopwallpapers = os.path.expanduser("~/.config/desktopwallpapers/")
if qtile.core.name == "wayland":
    apps = {
        "web_browser": "qutebrowser",
        "terminal": "alacritty -e tmux new-session -A -s tty",
        "nterminal": f"alacritty -e {tmux_browser}",
        # Launches in a dropdown
        "file_manager": f"alacritty -T 'File Manager' -e tmux new-session -A -s files '{file_man}'",
        "calculator": "qalculate-gtk",  # launches in a dropdown
        "email": "thunderbird",
        "screenshot_software": os.path.expanduser("~/.config/satty/screenshot"),
        "emoji_keyboard": "rofi -monitor -1 -show emoji -theme infinity-list",
        "application_launcher": "fuzzel",
        "task_switcher": "rofi -show window -monitor -1 -theme infinity-list",
        "clipboard": os.path.expanduser("~/.config/fuzzel/cliphist"),
        "find_file": f"alacritty -T File\ Finder -e {search_script}",
        "music_player": "spotify-launcher",  # Launches in a dropdown
        "password_manager": "bitwarden-desktop",  # Launches in a dropdown
        "notes": f"alacritty -T Notes --working-directory notes -e tmux new-session -A -s notes nvim",
    }
else:
    apps = {
        "web_browser": "qutebrowser",
        "terminal": "alacritty -e tmux new-session -A -s tty",
        "nterminal": f"alacritty -e {tmux_browser}",
        # Launches in a dropdown
        "file_manager": f"alacritty -T 'File Manager' -e tmux new-session -A -s files '{file_man}'",
        "calculator": "qalculate-gtk",  # launches in a dropdown
        "email": "thunderbird",
        "screenshot_software": "flameshot gui",
        "emoji_keyboard": "rofi -monitor -1 -show emoji -theme infinity-list",
        "application_launcher": "rofi -show drun -monitor -1 -theme infinity-list",
        "task_switcher": "rofi -show window -monitor -1 -theme infinity-list",
        "clipboard": "cliphist list | fuzzel --dmenu",
        "find_file": f"alacritty -T File\ Finder -e {search_script}",
        "music_player": "spotify-launcher",  # Launches in a dropdown
        "password_manager": "bitwarden-desktop",  # Launches in a dropdown
        "notes": f"alacritty -T Notes --working-directory notes -e tmux new-session -A -s notes nvim",
    }


colors = {
    "black": "#111112",
    "dark4": "#222224",
    "dark3": "#28282A",
    "dark2": "#2E2E30",
    "dark1": "#3C3C3E",
    "grey2": "#6F7073",
    "grey1": "#A0A1A2",
    "grey0": "#D0D1D1",
    "white": "#F8F8F2",
    "blue": "#4CACE6",
    "light_blue": "#61B6EA",
    "light_yellow": "#FDC64E",
    "yellow": "#FBB750",
    "dark_yellow": "#FDA308",
    "light_magenta": "#C97DD8",
    "magenta": "#BF67D6",
    "dark_magenta": "#AA57D1",
    "green": "#7FBA67",
    "dark_green": "#73BB54",
    "orange": "#FF9E42",
    "cyan": "#2CCADB",
    "dark_cyan": "#37A8B7",
    "light_red": "#ED5A66",
    "red": "#DE5D68",
    "dark_red": "#833b3b",
}

font = "JetBrainsMono Nerd Font Mono"


widget_defaults = {
    "font": font,
    "fontsize": 13,
    "padding": 8,
    "background": f'{colors["dark3"]}',
    "foreground": colors["white"],
}

# Boolean Variables
auto_fullscreen = True
bring_front_click = True
cursor_warp = False
focus_on_window_activation = "smart"
follow_mouse_focus = False
reconfigure_screens = True
# If you have issues with steam games not minimizing set this to true
auto_minimize = False
dgroups_key_binder = None
dgroups_app_rules = []
wmname = "LG3D"  # This is false this is just to help with java UI tookits

# Screens
main_screen = False
if os.path.exists(os.path.expanduser("/tmp/.screens")):
    with open(os.path.expanduser("/tmp/.screens")) as file:
        lines = file.readlines()
        screen_count = int(lines[0])
        if len(lines) > 1:
            main_screen = int(lines[1])
elif os.getenv("SCREENS"):
    screen_count = int(os.environ["SCREENS"])
    if os.getenv("MAIN_SCREEN"):
        main_screen = int(os.environ["MAIN_SCREEN"])
else:
    screen_count = 1


screens = []
if screen_count > 1:

    if main_screen:
        for x in range(screen_count):
            if x == main_screen - 1:
                screens.append(
                    Screen(
                        top=bar.Bar(widgets.Widgets(colors).get_widgets(), 26),
                        wallpaper=get_wallpaper(desktopwallpapers),
                        wallpaper_mode="fill",
                    )
                )
            else:
                screens.append(
                    Screen(
                        top=bar.Bar(
                            widgets.Widgets(colors).get_secondary_widgets(), 26
                        ),
                        wallpaper=get_wallpaper(desktopwallpapers),
                        wallpaper_mode="fill",
                    )
                )

    else:
        for x in range(screen_count - 1):
            if x == 1:
                screens.append(
                    Screen(
                        top=bar.Bar(widgets.Widgets(colors).get_widgets(), 26),
                        wallpaper=get_wallpaper(desktopwallpapers),
                        wallpaper_mode="fill",
                    )
                )
            else:
                screens.append(
                    Screen(
                        top=bar.Bar(
                            widgets.Widgets(colors).get_secondary_widgets(), 26
                        ),
                        wallpaper=get_wallpaper(desktopwallpapers),
                        wallpaper_mode="fill",
                    )
                )

else:
    screens.append(
        Screen(
            top=bar.Bar(widgets.Widgets(colors).get_widgets(), 26),
            wallpaper=get_wallpaper(desktopwallpapers),
            wallpaper_mode="fill",
        )
    )


# Layouts & Groups
qtile_groups = layouts_and_groups.Groups()
groups = qtile_groups.get_groups(apps)
qtile_layouts = layouts_and_groups.Layouts(colors, font)
layouts = qtile_layouts.get_layouts()
floating_layout = qtile_layouts.get_floating_layout()

# Keymaps (edit under keymaps.py)
keybinds = keymaps.Keybinds()
keys = keybinds.generate_keybinds(apps, qtile_groups.groups)
mouse = keybinds.generate_mouse_keybinds()

# Autostart
# Runs the auto start script on system startup


@hook.subscribe.screen_change
def screen_change(event):
    qtile.reconfigure_screens()


@hook.subscribe.startup_once
def autostart():
    if qtile.core.name == "x11":
        autostart = os.path.expanduser("~/.config/qtile/scripts/autostart-x11")
    elif qtile.core.name == "wayland":
        autostart = os.path.expanduser("~/.config/qtile/scripts/autostart-wayland")
    subprocess.call([autostart])
