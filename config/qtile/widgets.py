import os

import plugins
from libqtile import widget
from libqtile.lazy import lazy


class Widgets:
    def __init__(self, colors, apps):
        self.colors = colors
        self.left_widgets = [
            plugins.CurrentScreen(
                active_text=" ◉ ",
                active_color=colors["blue"],
                inactive_text=" ◉ ",
                foreground=colors["black"],
                inactive_color=colors["magenta"],
                fontsize=17,
                padding=0,
                margin=0,
                mouse_callbacks={"Button1": lazy.spawn(apps["application_launcher"])},
            ),
            widget.TaskList(
                icon_size=20,
                max_title_width=450,
                highlight_method="block",
                borderwidth=0,
                margin=0,
                padding_x=8,
                padding_y=4,
                rounded=False,
                spacing=8,
                border=colors["dark1"],
                unfocused_border=colors["dark3"],
                theme_mode="fallback",
                theme_path="/usr/share/icons/Papirus-Dark/",
            ),
            widget.Chord(
                foreground=colors["dark4"],
                background=colors["magenta"],
            ),
        ]
        self.primary_widgets = [
            widget.Prompt(
                foreground=colors["dark4"],
                cursor_color=colors["dark4"],
                background=colors["green"],
                margin=8,
            ),
            widget.Mpris2(
                paused_text="⏸  {track}",
                playing_text="⏵  {track}",
                format="𝅘𝅥𝅯 {xesam:title} - {xesam:artist} 𝅘𝅥𝅯",
                width=350,
                no_metadata_text="𝅘𝅥𝅯",
                stopped_text="⏹",
                background=colors["dark3"],
                padding=10,
            ),
            widget.Spacer(5, background=colors["dark3"]),
            widget.CPU(
                background=colors["dark1"], format=" {freq_current}GHz {load_percent}%"
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
                mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
            ),
            widget.Memory(background=colors["dark1"], format=" {MemPercent}%"),
        ]
        self.primary_widgets_two = [
            widget.WidgetBox(
                widgets=[
                    widget.Sep(
                        foreground=colors["grey2"],
                        linewidth=2,
                        size_percent=40,
                        padding=4,
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Clock(
                        timezone="US/Central",
                        format="US, %a %I:%M%p",
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Sep(
                        foreground=colors["grey2"],
                        linewidth=2,
                        size_percent=40,
                        padding=4,
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Clock(
                        timezone="Europe/Amsterdam",
                        format="EU, %a %I:%M%p",
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Sep(
                        foreground=colors["grey2"],
                        linewidth=2,
                        size_percent=40,
                        padding=4,
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Clock(
                        timezone="Europe/London",
                        format="UK, %a %I:%M%p",
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.Sep(
                        foreground=colors["grey2"],
                        linewidth=2,
                        size_percent=40,
                        padding=4,
                        background=colors["dark1"],
                        mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                    ),
                    widget.StatusNotifier(
                        foreground=colors["grey2"],
                        background=colors["dark1"],
                    ),
                ],
                close_button_location="right",
                background=colors["dark1"],
                text_open="",
                text_closed="",
                fontsize=15,
                mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                padding=10,
            ),
        ]

        self.center_widgets = [
            widget.GroupBox(
                fontsize=14,
                highlight_method="block",
                this_current_screen_border=colors["blue"],
                this_screen_border=colors["magenta"],
                other_current_screen_border=colors["grey1"],
                other_screen_border=colors["grey1"],
                active=colors["white"],
                block_highlight_text_color=colors["dark4"],
                disable_drag=False,
                use_mouse_wheel=False,
                inactive=colors["grey1"],
                rounded=False,
                background=colors["dark1"],
                margin_x=0,
                hide_unused=True,
            ),
        ]
        self.right_widgets = [
            widget.Spacer(5, background=colors["dark1"]),
            widget.Clock(
                format="󰃮 %a, %B %d",
                mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                padding=4,
                background=colors["dark1"],
            ),
            widget.Clock(
                timezone="Australia/Brisbane",
                format="%I:%M:%S%p",
                mouse_callbacks={"Button1": lazy.widget["widgetbox"].toggle()},
                background=colors["dark1"],
            ),
            widget.Sep(
                foreground=colors["grey2"],
                linewidth=2,
                size_percent=40,
                padding=4,
                background=colors["dark1"],
            ),
            widget.Spacer(5, background=colors["dark1"]),
            widget.CurrentLayout(
                mode="icon",
                scale=0.5,
                foreground=colors["white"],
                padding=0,
                background=colors["dark1"],
            ),
            widget.Spacer(5, background=colors["dark1"]),
        ]

    def laptop_widgets(self):
        try:
            device_type = os.environ["DEVICE_TYPE"]
        except KeyError:
            device_type = "PC"

        if device_type != "LAPTOP":
            return []
        else:
            return [
                widget.Spacer(3, background=self.colors["dark1"]),
                widget.BatteryIcon(
                    scale=1.2,
                    theme_path="~/.config/qtile/icons/",
                    background=self.colors["dark1"],
                ),
                widget.Battery(
                    battery=0,
                    show_short_text=False,
                    low_percentage=0.2,
                    format="{percent:2.0%}",
                    full_char="󰁹",
                    empty_char="󰁺",
                    charge_char="󰂏",
                    discharge_char="󰂌",
                    unknown_char="󰂑",
                    background=self.colors["dark1"],
                    mouse_callbacks={
                        "Button1": lazy.group["󱇚"].dropdown_toggle("power_manager")
                    },
                ),
                widget.Sep(
                    foreground=self.colors["grey2"],
                    linewidth=2,
                    background=self.colors["dark1"],
                    size_percent=40,
                    padding=4,
                ),
            ]

    def get_widgets(self):
        return (
            self.left_widgets
            + self.primary_widgets
            + self.center_widgets
            + self.laptop_widgets()
            + self.primary_widgets_two
            + self.right_widgets
        )

    def get_secondary_widgets(self):
        return self.left_widgets + self.center_widgets + self.right_widgets
