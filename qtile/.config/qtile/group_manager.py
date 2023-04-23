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

from libqtile.config import Group, ScratchPad, DropDown, Match

GROUPS = [
    # Group(" ", layout="bsp", screen_affinity=1),
    # Group("", layout="bsp", matches=[Match(wm_class="vscodium"), Match(wm_class="emacs")]),
    # Group(" ", layout="bsp", matches=[Match(wm_class="Mail")]),
    # Group(" ", layout="bsp", screen_affinity=3, matches=[Match(wm_class="signal")]),
    # Group(" ", layout="bsp", screen_affinity=2),
    Group("", layout="bsp", screen_affinity=1),
    Group("", layout="bsp"),
    Group("", layout="bsp", matches=[
          Match(wm_class="vscodium"), Match(wm_class="emacs")]),
    Group("", layout="bsp", matches=[Match(wm_class="Mail")]),
    Group("", layout="bsp", screen_affinity=3,
          matches=[Match(wm_class="signal"), Match(wm_class="discord")]),
    Group("", layout="bsp", screen_affinity=2),
    Group("", layout="bsp", init=False, persist=False),
]
SCRATCHPADS = []

default_scratch_pad_settings = {
    "on_focus_last_hide": True,
    "warp_pointer": True,
    "height": 0.5,
    "opacity": 0.85,
    "width": 0.4,
    "x": 0.3,
    "y": -0.0075,
}


def generate_scratchpads(apps):
    dropdowns = []
    for app in apps:
        options = dict(default_scratch_pad_settings)
        if "dropdown_options" in apps[app]:
            for option in apps[app]["dropdown_options"]:
                options[option] = apps[app]["dropdown_options"][option]

        dropdowns.append(DropDown(app, apps[app]["name"], **options))

    global SCRATCHPADS
    SCRATCHPADS.append(ScratchPad("", dropdowns, single=True))


def get_groups():
    return GROUPS + SCRATCHPADS
