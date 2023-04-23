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

from libqtile.config import Screen
import os
import subprocess
from libqtile.log_utils import logger


def toggle_max_layout(qtile):
    """
    Toggles between the first and second layout configured
    0 = Max and 1 = BSP
    """
    if qtile.current_group.current_layout == 0:
        qtile.cmd_to_layout_index(1)
    else:
        qtile.cmd_to_layout_index(0)
    return None


def resize(qtile, direction, shrink=None):
    """
    Resizes windows based on type (Floating, BSP, ETC)
    params:
    direction: direction to resize "up","right","down","left"
    """
    window = qtile.current_window
    if window.floating:
        # Resizes floating windows
        # down key grows window vertically
        # Up key shrinks window verically
        # right key grows window horizontally
        # left key shrinks window horizontally
        floating_grow_amount = 75
        if direction == "down":
            window.cmd_resize_floating(0,int(floating_grow_amount))
        elif direction == "right":
            window.cmd_resize_floating(int(floating_grow_amount),0)
            window.cmd_move_floating(-int(floating_grow_amount/2), 0)
        elif direction == "up":
            window.cmd_resize_floating(0,-int(floating_grow_amount))
        elif direction == "left":
            window.cmd_resize_floating(-int(floating_grow_amount),0)
            window.cmd_move_floating(int(floating_grow_amount/2), 0)

    elif qtile.current_group.current_layout != 1:  # If layout is not BSP
        grow_layout = {
            "up": qtile.current_layout.cmd_grow_up,
            "right": qtile.current_layout.cmd_grow_right,
            "down": qtile.current_layout.cmd_grow_down,
            "left": qtile.current_layout.cmd_grow_left,
        }
        grow_layout[direction]()
    else:  # If layout is BSP
        layout = qtile.current_layout
        child = layout.current
        parent = child.parent
        while parent:
            if child in parent.children:
                layout_all = False

                if (direction == "left" and parent.split_horizontal) or (
                        direction == "up" and not parent.split_horizontal):
                    parent.split_ratio = max(
                        5, parent.split_ratio - layout.grow_amount)
                    layout_all = True
                elif (direction == "right" and parent.split_horizontal) or (
                        direction == "down" and not parent.split_horizontal):
                    parent.split_ratio = min(
                        95, parent.split_ratio + layout.grow_amount)
                    layout_all = True
                if layout_all:
                    layout.group.layout_all()
                    break
            child = parent
            parent = child.parent

def move(qtile, direction):
    window = qtile.current_window
    if window.floating:
        logger.warn("float")
        # Moves floating windows
        floating_move_amount = 75
        if direction == "down":
            window.cmd_move_floating(0,floating_move_amount)
        elif direction == "right":
            window.cmd_move_floating(floating_move_amount,0)
        elif direction == "up":
            window.cmd_move_floating(0,-floating_move_amount)
        elif direction == "left":
            window.cmd_move_floating(-floating_move_amount,0)
    else:
        logger.warn("no float")
        move_layout = {
            "up": qtile.current_layout.cmd_shuffle_up,
            "right": qtile.current_layout.cmd_shuffle_right,
            "down": qtile.current_layout.cmd_shuffle_down,
            "left": qtile.current_layout.cmd_shuffle_left,
        }
        move_layout[direction]()

def refresh_system(qtile):
    qtile.cmd_reload_config()
    home = os.path.expanduser('~/.config/qtile/refresh_system.sh')
    subprocess.call([home])


def float_to_front(qtile):
    """
    Bring all floating windows of the group to front
    """
    for window in qtile.current_group.windows:
        if window.floating:
            window.cmd_bring_to_front()


# Allows for shifting focus between screens with the same keys as shifting focus between windows
def traverse_up(qtile):
    _focus_window(qtile, -1, 'y')


def traverse_down(qtile):
    _focus_window(qtile, 1, 'y')


def traverse_left(qtile):
    _focus_window(qtile, -1, 'x')


def traverse_right(qtile):
    _focus_window(qtile, 1, 'x')


def _focus_window(qtile, dir, axis):
    win = None
    win_wide = None
    dist = 10000
    dist_wide = 10000
    cur = qtile.current_window
    if not cur:
        cur = qtile.current_screen

    if axis == 'x':
        dim = 'width'
        band_axis = 'y'
        band_dim = 'height'
        cur_pos = cur.x
        band_min = cur.y
        band_max = cur.y + cur.height
    else:
        dim = 'height'
        band_axis = 'x'
        band_dim = 'width'
        band_min = cur.x
        cur_pos = cur.y
        band_max = cur.x + cur.width

    cur_pos += getattr(cur, dim) / 2

    windows = [w for g in qtile.groups if g.screen for w in g.windows]
    windows.extend([s for s in qtile.screens if not s.group.windows])

    if cur in windows:
        windows.remove(cur)

    for w in windows:
        if isinstance(w, Screen) or not w.minimized:
            pos = getattr(w, axis) + getattr(w, dim) / 2
            gap = dir * (pos - cur_pos)
            if gap > 5:
                band_pos = getattr(w, band_axis) + getattr(w, band_dim) / 2
                if band_min < band_pos < band_max:
                    if gap < dist:
                        dist = gap
                        win = w
                else:
                    if gap < dist_wide:
                        dist_wide = gap
                        win_wide = w

    if not win:
        win = win_wide
    if win:
        qtile.focus_screen(win.group.screen.index)
        win.group.focus(win, True)
        if not isinstance(win, Screen):
            win.focus(False)
