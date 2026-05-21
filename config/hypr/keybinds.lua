local apps = require("apps")

local mainMod = "SUPER"

local function exec(command)
  return hl.dsp.exec_cmd(command)
end

local function reset()
  return hl.dsp.submap("reset")
end

------------------
-- APP LAUNCH MODE
------------------

hl.bind(mainMod .. " + X", hl.dsp.submap("App Launch Mode"))

hl.define_submap("App Launch Mode", function()

  hl.bind("W", function()
    hl.dispatch(exec(apps.webBrowser))
    hl.dispatch(reset())
  end)

  hl.bind("F", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("file_manager"))
    hl.dispatch(reset())
  end)

  hl.bind("E", function()
    hl.dispatch(exec(apps.email))
    hl.dispatch(reset())
  end)

  hl.bind("Return", function()
    hl.dispatch(exec(
      apps.terminal .. " -e $HOME/.config/tmux/scripts/tmux-browser"
    ))
    hl.dispatch(reset())
  end)

  hl.bind("S", function()
    hl.dispatch(exec(apps.screenshotSoftware))
    hl.dispatch(reset())
  end)

  hl.bind("B", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("bluetooth"))
    hl.dispatch(reset())
  end)

  hl.bind("V", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("audio_mixer"))
    hl.dispatch(reset())
  end)

  hl.bind("N", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("notes"))
    hl.dispatch(reset())
  end)

  hl.bind("C", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("calculator"))
    hl.dispatch(reset())
  end)

  hl.bind("M", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("music_player"))
    hl.dispatch(reset())
  end)

  hl.bind("P", function()
    hl.dispatch(hl.dsp.workspace.toggle_special("password_manager"))
    hl.dispatch(reset())
  end)

  hl.bind("escape", reset())
end)

------------------
-- WINDOW CONTROL MODE
------------------

hl.bind(mainMod .. " + R", hl.dsp.submap("Window Control Mode"))

hl.define_submap("Window Control Mode", function()

  hl.bind(
    "right",
    hl.dsp.window.resize({
      x = 10,
      y = 0,
      relative = true,
    }),
    { repeating = true }
  )

  hl.bind(
    "left",
    hl.dsp.window.resize({
      x = -10,
      y = 0,
      relative = true,
    }),
    { repeating = true }
  )

  hl.bind(
    "up",
    hl.dsp.window.resize({
      x = 0,
      y = -10,
      relative = true,
    }),
    { repeating = true }
  )

  hl.bind(
    "down",
    hl.dsp.window.resize({
      x = 0,
      y = 10,
      relative = true,
    }),
    { repeating = true }
  )

  hl.bind("escape", reset())
end)

------------------
-- EXTRA WORKSPACES
------------------

hl.bind(
  mainMod .. " + SHIFT + N",
  hl.dsp.focus({ workspace = 14 })
)

hl.bind(
  mainMod .. " + N",
  hl.dsp.window.move({ workspace = 14 })
)

------------------
-- APP LAUNCH
------------------

hl.bind(
  mainMod .. " + Return",
  hl.dsp.workspace.toggle_special("terminal")
)

hl.bind(
  mainMod .. " + D",
  exec(apps.menu)
)

hl.bind(
  mainMod .. " + V",
  exec("$HOME/.config/fuzzel/cliphist")
)

------------------
-- SYSTEM
------------------

hl.bind(
  mainMod .. " + CTRL + C",
  hl.dsp.window.close()
)

hl.bind(
  mainMod .. " + CTRL + Q",
  hl.dsp.exit()
)

hl.bind(
  mainMod .. " + CTRL + R",
  exec("$HOME/.config/hypr/scripts/wallpaper-reload.sh")
)

hl.bind(
  mainMod .. " + F",
  hl.dsp.window.float({
    action = "toggle",
  })
)

hl.bind(
  mainMod .. " + P",
  hl.dsp.window.pseudo()
)

hl.bind(
  mainMod .. " + M",
  hl.dsp.window.fullscreen({
    mode = "maximized",
    action = "toggle",
  })
)

hl.bind(
  mainMod .. " + Space",
  hl.dsp.window.cycle_next({
    next = true,
  })
)

hl.bind(
  mainMod .. " + B",
  exec("$HOME/.config/hypr/scripts/rename-workspace.sh")
)

------------------
-- FOCUS MOVEMENT
------------------

hl.bind(
  mainMod .. " + left",
  hl.dsp.focus({ direction = "left" })
)

hl.bind(
  mainMod .. " + right",
  hl.dsp.focus({ direction = "right" })
)

hl.bind(
  mainMod .. " + up",
  hl.dsp.focus({ direction = "up" })
)

hl.bind(
  mainMod .. " + down",
  hl.dsp.focus({ direction = "down" })
)

------------------
-- WORKSPACES
------------------

for i = 1, 9 do

  hl.bind(
    mainMod .. " + " .. i,
    hl.dsp.focus({
      workspace = i,
    })
  )

  hl.bind(
    mainMod .. " + SHIFT + " .. i,
    hl.dsp.window.move({
      workspace = i,
    })
  )

end

hl.bind(
  mainMod .. " + 0",
  hl.dsp.focus({
    workspace = 10,
  })
)

hl.bind(
  mainMod .. " + Q",
  hl.dsp.focus({
    workspace = 11,
  })
)

hl.bind(
  mainMod .. " + W",
  hl.dsp.focus({
    workspace = 12,
  })
)

hl.bind(
  mainMod .. " + E",
  hl.dsp.focus({
    workspace = 13,
  })
)

hl.bind(
  mainMod .. " + SHIFT + 0",
  hl.dsp.window.move({
    workspace = 10,
  })
)

hl.bind(
  mainMod .. " + SHIFT + Q",
  hl.dsp.window.move({
    workspace = 11,
  })
)

hl.bind(
  mainMod .. " + SHIFT + W",
  hl.dsp.window.move({
    workspace = 12,
  })
)

hl.bind(
  mainMod .. " + SHIFT + E",
  hl.dsp.window.move({
    workspace = 13,
  })
)

------------------
-- WORKSPACE SCROLLING
------------------

hl.bind(
  mainMod .. " + mouse_down",
  hl.dsp.focus({
    workspace = "e+1",
  })
)

hl.bind(
  mainMod .. " + mouse_up",
  hl.dsp.focus({
    workspace = "e-1",
  })
)

------------------
-- MOUSE BINDS
------------------

hl.bind(
  mainMod .. " + mouse:272",
  hl.dsp.window.drag(),
  { mouse = true }
)

hl.bind(
  mainMod .. " + mouse:273",
  hl.dsp.window.resize(),
  { mouse = true }
)

------------------
-- AUDIO / BRIGHTNESS
------------------

hl.bind(
  "XF86AudioRaiseVolume",
  exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  {
    locked = true,
    repeating = true,
  }
)

hl.bind(
  "XF86AudioLowerVolume",
  exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  {
    locked = true,
    repeating = true,
  }
)

hl.bind(
  "XF86AudioMute",
  exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  {
    locked = true,
    repeating = true,
  }
)

hl.bind(
  "XF86AudioMicMute",
  exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  {
    locked = true,
    repeating = true,
  }
)

hl.bind(
  "XF86MonBrightnessUp",
  exec("brightnessctl s 10%+"),
  {
    locked = true,
    repeating = true,
  }
)

hl.bind(
  "XF86MonBrightnessDown",
  exec("brightnessctl s 10%-"),
  {
    locked = true,
    repeating = true,
  }
)

------------------
-- MEDIA
------------------

hl.bind(
  "XF86AudioNext",
  exec("playerctl next"),
  {
    locked = true,
  }
)

hl.bind(
  "XF86AudioPause",
  exec("mpris2controller PlayPause"),
  {
    locked = true,
  }
)

hl.bind(
  "XF86AudioPlay",
  exec("mpris2controller PlayPause"),
  {
    locked = true,
  }
)

hl.bind(
  "XF86AudioPrev",
  exec("playerctl previous"),
  {
    locked = true,
  }
)
