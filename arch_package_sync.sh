#!/bin/bash

# List of packages from the official repositories
official_packages=(
  fuzzel
  font-manager
  libreoffice-fresh
  fish
  extra/jre-openjdk 
  gnome-themes-extra
  file-roller
  tldr
  tmux
  alacritty 
  arandr 
  glow
  autorandr
  base-devel 
  bat 
  bitwarden 
  bitwarden-cli 
  bluez
  bluez-utils
  brightnessctl
  clipmenu 
  composer 
  dbus 
  dunst 
  fd 
  feh 
  findutils
  firefox 
  flameshot 
  fuse3 
  fzf
  git 
  glib2
  gnome-keyring 
  gvfs
  gvfs-smb
  htop 
  kitty 
  lazygit 
  light-locker
  lightdm
  lightdm-gtk-greeter 
  lxappearance 
  lxrandr 
  mandoc
  nano 
  neofetch 
  neovim 
  noto-fonts 
  noto-fonts-cjk 
  noto-fonts-emoji 
  noto-fonts-extra 
  npm 
  pdfjs
  picom 
  polkit-gnome
  pulseaudio-bluetooth
  pulsemixer 
  python-adblock 
  python-dateutil
  python-dbus-next
  python-pip 
  python-psutil 
  python-pyperclip 
  python-pytz
  python-tldextract 
  qalculate-gtk 
  qt5ct 
  qtile 
  qutebrowser 
  reflector
  ripgrep 
  rofi 
  rofi-emoji 
  rust 
  thunar
  thunderbird
  tree
  ttf-dejavu 
  ttf-jetbrains-mono-nerd 
  ttf-ubuntu-font-family 
  udiskie 
  unrar 
  unzip 
  xdg-utils 
  xdotool
  xorg-server 
  xorg-xinit 
  spotifyd
  xsel 
  yt-dlp 
  zip 
)

# List of LF preview packages
# Official
lf_official_packages=(
  lf 
  imagemagick
  poppler
  bat 
  p7zip
  catdoc 
  docx2txt 
  odt2txt 
  gnumeric 
  fzf
  trash-cli
)
# AUR
  lf_aur_packages=(
  xapp-epub-thumbnailer
  wkhtmltopdf-static
)

# List of AUR packages
aur_packages=(
  bibata-cursor-theme 
  papirus-linux-universe 
  mpris2controller-git 
  unclutter-xfixes-git 
  ueberzugpp
  brave-bin 
  cp-p-git
)
packages_to_remove=(
  spotify
  spotify-launcher
  vim 
)

# Install packages from the official repositories
sudo pacman -Syu --noconfirm --needed "${official_packages[@]}"
sudo pacman -Syu --noconfirm --needed "${lf_official_packages[@]}"

# Check if yay is installed, install if necessary
if ! command -v yay &> /dev/null; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Install AUR packages using yay
yay -S --noconfirm --needed "${aur_packages[@]}"
yay -S --noconfirm --needed "${lf_aur_packages[@]}"
