hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 2,
    sensitivity = -0.0,
    special_fallthrough = true,
    float_switch_override_focus = 0,
    numlock_by_default = true,

    touchpad = {
      natural_scroll = false,
    },
  },

  binds = {
    workspace_back_and_forth = true,
    movefocus_cycles_fullscreen = false,
    disable_keybind_grabbing = true,
    hide_special_on_workspace_change = true,
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})
