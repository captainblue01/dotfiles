---------------------
---- MY PROGRAMS ----
---------------------
local apps = {
  terminalDropDown = "alacritty -T 'Drop Down TTY' -e tmux new-session -A -s tty",
  terminal = "alacritty",
  fileManager = "alacritty -T 'File Manager' -e tmux new-session -A -s files lf",
  notes = "alacritty -T Notes --working-directory Notes -e tmux new-session -A -s notes nvim",
  menu = "fuzzel",
  webBrowser = "firefox",
  email = "thunderbird",
  bluetooth = "alacritty -T 'Bluetooth' -e bluetui",
  audioMixer = "alacritty -T 'Mixer' -e pulsemixer",
  calculator = "qalculate-gtk",
  musicPlayer = "spotify-launcher",
  passwordManager = "bitwarden-desktop",
  screenshotSoftware = "$HOME/.config/satty/screenshot",
}

return apps
