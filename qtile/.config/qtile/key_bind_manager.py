# Copyright (c) 2023 Brodie Henry
#
#        :=*%+:              .-==-.
#     -+####@@@@#=.       :-++++++++-:     Brodie Henry
# .=*#######@@@@@@@%+:.:=++++++++++++++=:. brodie@infinitydigital.systems
# **########@@@@@@@%*+++++++++++++++++++**
# *****#####@@@%#*+++++++++++++++++++***** Infinity Digital
# *********#%*+++++++++++++++++++********* https://Infinitydigital.systems/
# *******+++++++++++++++++++*#@@###*******
# ****+++++++++++++++++++*%@@@@@######****
# =++++++++++++++++++=+%@@@@@@@@#########+ Copyright (c) 2023 Infinity Digital
#  :-++++++++++++-:    -*@@@@@@######+:    Copyright (c) 2023 Brodie Henry
#      .:=++++=:.          :+%@@##*=.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, MODify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
from libqtile.config import Key, KeyChord, Click, Drag, Match
from libqtile.lazy import lazy
import group_manager
import qtile_infinity_lib as qil

# Modifer Key
MOD = "MOD4"  # mod4 = Super / Windows / Command

# APP Keybinds
# Set keybinds to launch apps below
#
# name: name of the application (needs to be the launch command)
# key: Keybind to launch the application
# key_cord: Optional replacment for key value
# dropdown: Wether to launch the window as a drop down (scratchpad)
# dropdown_options: (not required) options for dropdowns
app_chord_pre_key = [[MOD], "x"]
APPS = {
    "terminal": {
        "name": "alacritty",
        "key": [[MOD], "Return"],
        "dropdown": True,
        "dropdown_options": {"opacity": 1.0, "height": 0.25}
    },
    "terminal_new_window": {
        "name": "alacritty",
        "key_cord": [app_chord_pre_key, [[], "Return"]],
        "dropdown": False,
    },
    "file_browser": {
        "name": "alacritty -e lf",
        "key_cord": [app_chord_pre_key, [[], "f"]],
        "dropdown": True,
        "dropdown_options": {"opacity": 1.0, "height": 0.6, "width": 0.5, "x": 0.25}
    },
    "web_browser": {
        "name": "firefox",
        "key_cord": [app_chord_pre_key, [[], "w"]],
        "dropdown": False,
    },
    "email_client": {
        "name": "thunderbird",
        "key_cord": [app_chord_pre_key, [[], "e"]],
        "dropdown": False,
    },
    "calculator": {
        "name": "qalculate-gtk -n",
        "key_cord": [app_chord_pre_key, [[], "c"]],
        "dropdown": True,
        "dropdown_options": {"height": 0.15}
    },
    "music_player": {
        "name": "spotify-launcher",
        "key_cord": [app_chord_pre_key, [[], "m"]],
        "dropdown": True,
        "dropdown_options": {"height": 0.6, "width": 0.5, "x": 0.25}
    },
    "ss_software": {
        "name": "flameshot gui",
        "key_cord": [app_chord_pre_key, [[], "s"]],
        "dropdown": False,
    },
    "app_launcher": {
        "name": "rofi -show drun -theme infinity-list",
        "key": [[MOD], "d"],
        "dropdown": False,
    },
    "window_switcher": {
        "name": "rofi -show window -theme infinity-icon",
        "key": [[MOD], "Tab"],
        "dropdown": False,
    },
    "emoji_keyboard": {
        "name": "rofi -show emoji -theme infinity-icon",
        "key": [[MOD], "e"],
        "dropdown": False,
    },
    "audio_control": {
        "name": "pavucontrol",
        "key_cord": [app_chord_pre_key, [[], "v"]],
        "dropdown": True,
    },
    "bluetooth_control": {
        "name": "blueberry",
        "key_cord": [app_chord_pre_key, [[], "b"]],
        "dropdown": True,
        "dropdown_options": {"match": Match(wm_class="blueberry.py")}
    },
    "password_manager": {
        "name": "1password",
        "key_cord": [app_chord_pre_key, [[], "p"]],
        "dropdown": True,
        "dropdown_options": {"height": 0.6, "width": 0.5, "x": 0.25}
    }
}

### Keybinds ###
MOUSE_KEYBINDS = [
    # Drag Floating layout
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front())
]

QTILE_KEYBINDS = [
    # Toggle Layouts
    Key([MOD], "c", lazy.next_layout(), desc="Cylces through the layouts"),
    Key([MOD], "f", lazy.window.toggle_floating(), desc="Toggles floating"),
    Key([MOD], "t", lazy.function(qil.float_to_front),
        desc="Brings all floating windows to the top"),
    # Kill window
    Key([MOD, "mod1"], "c", lazy.window.kill(), desc="Kill focused window"),
    # QTILE options
    Key([MOD, "mod1"], "r", lazy.function(
        qil.refresh_system), desc="Restart Qtile"),
    Key([MOD, "mod1"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD], "m", lazy.function(qil.toggle_max_layout), desc="Toggle Max Layout"),
    Key([MOD], "n", lazy.window.toggle_minimize(),
        desc="Toggle Minamize on current window"),
    Key([MOD], "b", lazy.widget["widgetbox"].toggle(), desc="Toggles Widget Box"),
]

MEDIA_KEYBINDS = [
    Key([],"XF86AudioRaiseVolume", lazy.widget["pulsevolume"].increase_vol(6), desc="Increases Volume"),
    Key([],"XF86AudioLowerVolume", lazy.widget["pulsevolume"].decrease_vol(6), desc="Decreases Volume"),
    Key([],"XF86AudioMute", lazy.widget["pulsevolume"].mute(), desc="Mutes Volume"),

    Key([],"XF86AudioPlay", lazy.spawn("mpris2controller PlayPause"), desc="Play/Pause player"),
    Key([],"XF86AudioNext", lazy.spawn("mpris2controller Next"), desc="Skip to next"),
    Key([],"XF86AudioPrev", lazy.spawn("mpris2controller Previous"), desc="Skip to Previous"),
]

FOCUS_SWITICHING_KEYBINDS = [
    Key([MOD], 'k', lazy.function(qil.traverse_up),
        desc="Shifts Focus up (will shift screens if at end of current screen)"),
    Key([MOD], 'j', lazy.function(qil.traverse_down),
        desc="Shifts Focus down (will shift screens if at end of current screen)"),
    Key([MOD], 'h', lazy.function(qil.traverse_left),
        desc="Shifts Focus left (will shift screens if at end of current screen)"),
    Key([MOD], 'l', lazy.function(qil.traverse_right),
        desc="Shifts Focus right (will shift screens if at end of current screen)"),
    Key([MOD], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key([MOD], "p", lazy.next_screen(), desc="Switches to next Screen"),
    Key([MOD], "o", lazy.prev_screen(), desc="Switches to previous Screen")
]

WINDOW_CONTROL = [
    KeyChord([MOD], "r", [
        # Focus Shift
        Key([MOD], 'k', lazy.function(qil.traverse_up),
            desc="Shifts Focus up (will shift screens if at end of current screen)"),
        Key([MOD], 'j', lazy.function(qil.traverse_down),
            desc="Shifts Focus down (will shift screens if at end of current screen)"),
        Key([MOD], 'h', lazy.function(qil.traverse_left),
            desc="Shifts Focus left (will shift screens if at end of current screen)"),
        Key([MOD], 'l', lazy.function(qil.traverse_right),
            desc="Shifts Focus right (will shift screens if at end of current screen)"),
        Key([MOD], "space", lazy.layout.next(),
            desc="Move window focus to other window"),
        Key([MOD], "p", lazy.next_screen(), desc="Switches to next Screen"),
        Key([MOD], "o", lazy.prev_screen(), desc="Switches to previous Screen"),

        # Resize Keys
        Key(["shift"], "h", lazy.function(qil.resize, "left"), desc="Grow window to the left"),
        Key(["shift"], "l", lazy.function(qil.resize, "right"), desc="Grow window to the right"),
        Key(["shift"], "j", lazy.function(qil.resize, "down"), desc="Grow window down"),
        Key(["shift"], "k", lazy.function(qil.resize, "up"), desc="Grow window up"),

        # Rearrange Windows
        Key(["mod1"], "h", lazy.function(qil.move, "left"), desc="Move window to the left"),
        Key(["mod1"], "l", lazy.function(qil.move, "right"), desc="Move window to the right"),
        Key(["mod1"], "j", lazy.function(qil.move, "down"), desc="Move window down"),
        Key(["mod1"], "k", lazy.function(qil.move, "up"), desc="Move window up"),
    ],
        mode=True,
        name="WINDOW CONTROL MODE"
    )
]

group_keys = {
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
    10: "0"
}
GROUP_KEYBINDS = [
    # Allows switching left to right between groups
    # Key(["control", "mod1"], "l", lazy.screen.next_group(), desc="Go to the next group"),
    # Key(["control", "mod1"], "h", lazy.screen.next_group(), desc="Go to the next group"),
]
# Loops through the groups and asigns group keybinds from the group keys keybind
for i, grp in enumerate(group_manager.GROUPS, 1):
    if i <= 10:
        # Switch to another group
        GROUP_KEYBINDS.append(
            Key([MOD], group_keys[i], lazy.group[grp.name].toscreen()))
        GROUP_KEYBINDS.append(Key([MOD, "shift"], group_keys[i], lazy.window.togroup(
            grp.name)))       # Send current window to another group
    else:
        break


# Sets up app key binds set them in the APPS constant at the top of the script
APP_KEYBINDS = []
SCRATCH_APPS = {}
APP_CORDS = {}

for app in APPS:
    if not APPS[app]["dropdown"]:
        command = lazy.spawn(APPS[app]["name"])
    else:
        command = lazy.group[''].dropdown_toggle(app)
        SCRATCH_APPS[app] = APPS[app]

    # Checks if keybind is single combination or key chord and creates the keybind
    # Keys
    if "key" in APPS[app]:
        new_key = Key(APPS[app]["key"][0], APPS[app]["key"][1], command)
        # Add keybinding to list of binds
        APP_KEYBINDS.append(new_key)
    # Key Chords
    elif "key_cord" in APPS[app]:
        cord = APPS[app]["key_cord"]

        # Setup all submaps
        # Loops through all the submap key binds and nests them
        submap = command
        for submap_keys in reversed(cord[1:]):
            submap = Key(submap_keys[0], submap_keys[1], submap)

        # Checks if the Chord already exists
        # If Chord already exists appeneds new submapping
        # If the Chord does not exist creates a new chord and assigns the current submapping
        if str(cord[0]) not in APP_CORDS:
            new_cord = {}
            new_cord["modifier"] = cord[0][0]
            new_cord["key"] = cord[0][1]
            new_cord["submaps"] = []
            APP_CORDS[str(cord[0])] = new_cord

        APP_CORDS[str(cord[0])]["submaps"].append(submap)

        #     CORDS[str(cord[0])]["modifier"] = cord[0][0]
        #     CORDS[str(cord[0])]["key"] = cord[0][1]
        # CORDS[str(cord[0])]["submaps"][app] = submap


# Adds app KeyChords to the list of keys
for cord in APP_CORDS:
    new_key = KeyChord(APP_CORDS[cord]["modifier"], APP_CORDS[cord]
                       ["key"], APP_CORDS[cord]["submaps"], name="LAUNCH APP CHORD")
    APP_KEYBINDS.append(new_key)


# Generates Scratchpad drops downs
if len(SCRATCH_APPS) != 0:
    group_manager.generate_scratchpads(SCRATCH_APPS)


def create_keybinds():
    return APP_KEYBINDS + QTILE_KEYBINDS + MEDIA_KEYBINDS + FOCUS_SWITICHING_KEYBINDS + WINDOW_CONTROL + GROUP_KEYBINDS
