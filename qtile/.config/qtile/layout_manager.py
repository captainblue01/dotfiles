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
#
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

from libqtile import layout
from libqtile.config import Match
from screen_manager import COLORS
# Edit layout margin setting from the screen_manager.py file
from screen_manager import MARGINS

GROW_AMOUNT = 7.5

### LAYOUTS ###
LAYOUTS = [
    layout.Max(margin=MARGINS),
    layout.Bsp(
        margin=MARGINS,
        margin_on_single=MARGINS,
        fair=False,
        border_width=3,
        grow_amount=GROW_AMOUNT,
        border_normal=COLORS["dark"],
        border_focus=COLORS["highlight"]
    ),
    # layout.TreeTab()
    # layout.Floating()
]
FLOATING_LAYOUTS = layout.Floating(
    border_width=3,
    border_normal=COLORS["dark"],
    border_focus=COLORS["highlight"],
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),             # gitk
        Match(wm_class='makebranch'),               # gitk
        Match(wm_class='maketag'),                  # gitk
        Match(wm_class='ssh-askpass'),              # ssh-askpass
        Match(title='branchdialog'),                # gitk
        Match(title='pinentry'),                    # GPG key password entry
        # Match(wm_class= "Qalculate-gtk"),
        # Match(title='Bitwarden'),
    ]
)
