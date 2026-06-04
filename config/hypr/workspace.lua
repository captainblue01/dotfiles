local apps = require("apps")

------------------
-- WORKSPACES
------------------

for i = 1, 6 do
  hl.workspace_rule({
    workspace = tostring(i),
  })
end

hl.workspace_rule({
  workspace = "name:Win",
  default_name = "Win",
})

hl.workspace_rule({
  workspace = "8",
  default_name = "TODO",
})

hl.workspace_rule({
  workspace = "9",
  default_name = "Vid",
})

hl.workspace_rule({
  workspace = "10",
  default_name = "Comms",
})

hl.workspace_rule({
  workspace = "11",
  default_name = "Dev",
})

hl.workspace_rule({
  workspace = "12",
  default_name = "Web",
})

hl.workspace_rule({
  workspace = "13",
  default_name = "Email",
})

hl.workspace_rule({
  workspace = "14",
  default_name = "Minimised",
})

------------------
-- SCRATCHPADS
------------------

hl.workspace_rule({
  workspace = "special:bluetooth",
  on_created_empty = apps.bluetooth,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({ 
  workspace = "special:audio_mixer", 
  on_created_empty = apps.audioMixer,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({
  workspace = "special:terminal",
  on_created_empty = apps.terminalDropDown,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({
  workspace = "special:file_manager",
  on_created_empty = apps.fileManager,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({
  workspace = "special:password_manager",
  on_created_empty = apps.passwordManager,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({
  workspace = "special:notes",
  on_created_empty = apps.notes,
  gaps_out = 200,
  border_size = 1,
})

hl.workspace_rule({
  workspace = "special:calculator",
  on_created_empty = apps.calculator,
})

hl.workspace_rule({
  workspace = "special:music_player",
  on_created_empty = apps.musicPlayer,
  gaps_out = 200,
  border_size = 1,
})

------------------
-- SCRATCHPAD WINDOW RULES
------------------

hl.window_rule({
  match = { title = "^(Mixer)$" },
  workspace = "special:audio_mixer",
})

hl.window_rule({
  match = { title = "^(Drop Down TTY)$" },
  workspace = "special:terminal",
})

hl.window_rule({
  match = { title = "^(Drop Down TTY)$" },
  float = true,
})

hl.window_rule({
  match = { title = "^(Drop Down TTY)$" },
  size = { "70%", "80%" },
})

hl.window_rule({
  match = { title = "^(File Manager)$" },
  workspace = "special:file_manager",
})

hl.window_rule({
  match = { class = "^(Bitwarden)$" },
  workspace = "special:password_manager",
})

hl.window_rule({
  match = { class = "^(1Password)$" },
  workspace = "special:password_manager",
})

hl.window_rule({
  match = { class = "^(qalculate-gtk)$" },
  workspace = "special:calculator",
})

hl.window_rule({
  match = { class = "^(qalculate-gtk)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(qalculate-gtk)$" },
  size = { 500, 600 },
})

hl.window_rule({
  match = { class = "^(spotify)$" },
  workspace = "special:music_player",
})

------------------
-- WINDOW RULES
------------------

-- hl.window_rule({
--   match = { class = ".*" },
--   suppress_event = "maximize",
-- })
--
-- hl.window_rule({
--   match = {
--     class = "^$",
--     title = "^$",
--     xwayland = true,
--     float = true,
--     fullscreen = false,
--     pin = false,
--   },
--   no_focus = true,
-- })
