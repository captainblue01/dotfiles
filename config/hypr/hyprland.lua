require("apps")
require("enviroment")
require("monitors")
require("autostart")
require("lookandfeel")
require("input")
require("keybinds")
require("workspace")

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})

debug.disable_logs = false
