local black = "rgba(111112FF)"
local bg = "rgba(222224FF)"
local bg1 = "rgba(28282aFF)"
local bg2 = "rgba(3c3c3eFF)"
local bg3 = "rgba(57585bFF)"
local fg = "rgba(d0d1d1FF)"
local red = "rgba(de5d68FF)"
local dark_red = "rgba(de5d68FF)"
local green = "rgba(76bb59FF)"
local dark_green = "rgba(64B143FF)"
local yellow = "rgba(fbb750FF)"
local orange = "rgba(fda308FF)"
local blue = "rgba(4cace6FF)"
local dark_blue = "rgba(368FE2FF)"
local purple = "rgba(bf67d6FF)"
local dark_purple = "rgba(aa57d1FF)"
local light_cyan = "rgba(18b5cdFF)"
local cyan = "rgba(18b5cdFF)"
local gray = "rgba(96979aFF)"

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 2,

    col = {
      active_border = {
        colors = { cyan, blue },
        angle = 45,
      },
      inactive_border = {
        colors = { bg2, bg },
        angle = 45,
      },
    },

    resize_on_border = true,
    layout = "dwindle",
  },

  decoration = {
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 7,
      render_power = 2,
      offset = { 1.2, 2 },
      color = "rgba(0, 0, 0, 0.4)",
    },

    blur = {
      enabled = true,
      size = 5,
      passes = 2,
      xray = true,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = false,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    focus_on_activate = false,
    mouse_move_focuses_monitor = false,
    disable_hyprland_logo = true,
    exit_window_retains_fullscreen = true,
    on_focus_under_fullscreen = 1,
    disable_splash_rendering = true,
  },
})

hl.workspace_rule({ workspace = "w[t1]", gaps_in = 0, gaps_out = 30, border_size = 0 })
hl.workspace_rule({ workspace = "w[tg1]", gaps_in = 0, gaps_out = 30, border_size = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_in = 0, gaps_out = 0, border_size = 0 })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "layers", enabled = false })
hl.animation({ leaf = "windows", enabled = false })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.5, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.79, bezier = "easeOutQuint", style = "gnomed" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.5, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = false })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
