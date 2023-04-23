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

from libqtile import bar, widget, qtile
from libqtile.config import Screen
from libqtile.lazy import lazy
# from screeninfo import get_monitors

BAR_THICKNESS = 30                                  # Thickness of the bar
MONITORS = 3                                       # Number of screens to setup
FONT = "JetBrainsMono Nerd Font Mono"               # QTILE FONT
MARGINS = 3
OUTSIDE_MARGIN = 8
COLORS = {
    "font_color": "#F8F8F2",
    "bar_background": "#202122",
    "highlight": "#2494BA",
    "dark": "#515D66",
    "inactive": "#515D66"
}
# Bar Location "top" or "bottom"
BAR_LOCATION = "top"

WIDGET_DEFAULTS = {
    "font": FONT + " SemiBold",
    "fontsize": 12.5,
    "padding": 6,
    "background": COLORS["bar_background"],
    "foreground": COLORS["font_color"]
}


class Widgets:
    def __init__(self):
        self.clock_widget = [widget.Clock(format="%A, %B %d - %I:%M%p ")]

    def bar_widgets(self, bar_type):
        """
        :param bar_type: Type of bar needed primary or secondary
        :return: Returns a list of widgets
        """
        popup_widgets = [
            widget.Prompt(
                foreground=COLORS["bar_background"],
                cursor_color=COLORS["bar_background"],
                background=COLORS["highlight"],
                margin=8
            ),
            widget.Chord(
                foreground=COLORS["bar_background"],
                background=COLORS["highlight"],
            ),
        ]
        window_widgets = [
            widget.Spacer(3),
            widget.Image(filename="~/.config/qtile/infin1.png", margin=6,
                         mouse_callbacks={"Button1": lazy.spawn("rofi -show drun")}),
            widget.Spacer(3),
            widget.CurrentScreen(
                active_color=COLORS["font_color"],
                inactive_color=COLORS["dark"],
                active_text="ﱣ",
                inactive_text="ﱤ"
            ),
            widget.WindowName(font=FONT+" Bold", max_chars=38),
        ]

        navbar_widgets = [
            widget.GroupBox(
                fontsize=22,
                highlight_method="line",
                disable_drag=True,
                this_current_screen_border=COLORS["highlight"],
                this_screen_border=COLORS["highlight"],
                other_current_screen_border=COLORS["dark"],
                other_screen_border=COLORS["dark"],
                active=COLORS["font_color"],
                inactive=COLORS["inactive"],
                margin=2,
                hide_unused=False
            ),
            widget.Spacer(bar.STRETCH),
        ]
        infobar_widgets = [
            widget.WidgetBox(
                close_button_location="right",
                text_open="  ",
                text_closed="  ",
                widgets=[
                    widget.Systray(icon_size=18),
                    widget.Spacer(5),
                    widget.Sep(
                        foreground=COLORS["inactive"], linewidth=2, size_percent=40, padding=4),
                    widget.CPU(format="CPU: {load_percent}%"),
                    widget.Sep(
                        foreground=COLORS["inactive"], linewidth=2, size_percent=40, padding=4),
                    widget.Memory(
                        measure_mem="G",
                        format='MEM: {MemUsed: .0f}{mm} /{MemTotal: .0f}{mm}'
                    ),
                    widget.Sep(
                        foreground=COLORS["inactive"], linewidth=2, size_percent=40, padding=4),
                    widget.Backlight(
                        font="JetBrainsMono Nerd Font",
                        backlight_name="intel_backlight",
                        change_command="light -S {0}",
                        step=2.5,
                        format="盛  {percent:2.0%}"
                    ),
                    widget.Sep(
                        foreground=COLORS["inactive"], linewidth=2, size_percent=40, padding=4),
                ]
            ),
            widget.Sep(foreground=COLORS["inactive"],
                       linewidth=2, size_percent=40, padding=4),
            widget.Battery(
                battery=0,
                show_short_text=False,
                low_percentage=0.3,
                format="{char} {percent:2.0%}",
                full_char='',
                empty_char='',
                charge_char='',
                discharge_char='',
                unknown_char=''
            ),
            widget.Sep(foreground=COLORS["inactive"],
                       linewidth=2, size_percent=40, padding=4),
            widget.PulseVolume(
                font="JetBrainsMono Nerd Font",
                fmt="墳 {}",
                scroll_step=3,
                mouse_callbacks={
                    "Button1": lazy.group[''].dropdown_toggle("audio_control")},
            ),
            widget.Sep(foreground=COLORS["inactive"],
                       linewidth=2, size_percent=40, padding=4),
        ]
        layout_icon = [
            widget.CurrentLayoutIcon(
                scale=0.5, foreground=COLORS["font_color"], padding=0),
        ]
        if bar_type == "primary":
            new_bar = popup_widgets + window_widgets + navbar_widgets + \
                infobar_widgets + self.clock_widget + layout_icon
        else:
            new_bar = popup_widgets + window_widgets + navbar_widgets + self.clock_widget + layout_icon
        return new_bar


class ScreenManager(Widgets):
    def __init__(self):
        super().__init__()

    def screens(self):
        screens = []
        for x in range(MONITORS):
            if x == 0:
                bar_widgets = self.bar_widgets("primary")
            else:
                bar_widgets = self.bar_widgets("secondary")
            if BAR_LOCATION == "top":
                screens.append(Screen(
                    top=bar.Bar(bar_widgets, BAR_THICKNESS,
                                margin=[0, 0, OUTSIDE_MARGIN, 0]),
                    bottom=bar.Gap(OUTSIDE_MARGIN),
                  left=bar.Gap(OUTSIDE_MARGIN),
                    right=bar.Gap(OUTSIDE_MARGIN)
                ))
            else:
                screens.append(Screen(bottom=bar.Bar(bar_widgets, BAR_THICKNESS, margin=[0, OUTSIDE_MARGIN, 0, 0]),
                                      top=bar.Gap(OUTSIDE_MARGIN),
                                      left=bar.Gap(OUTSIDE_MARGIN),
                                      right=bar.Gap(OUTSIDE_MARGIN)
                                      ))
        return screens
