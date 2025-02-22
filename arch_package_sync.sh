#!/bin/bash

# List of packages from the official repositories
official_packages=(
  # Qtile System
  cliphist
  fish
  tmux
  file-roller
  zip 
  alacritty 
  brightnessctl
  bluez
  bluez-utils
  dunst 
  gnome-keyring 
  gvfs
  gvfs-smb
  neofetch 
  neovim 
  python-psutil 
  python-dateutil
  thunar
  pulsemixer
  pavucontrol
  qt5ct 
  qt6ct 
  qalculate-gtk 
  qtile 
  python-dbus-next
  polkit-gnome
  python-pytz
  ntfs-3g
  python-dbus-fast
  kanshi
  python-pyxdg

  # Wayland
  python-pywlroots
  xorg-xwayland
  xdg-desktop-portal-wlr 
  xdg-desktop-portal-gtk
  qt5-wayland
  qt6-wayland


  # Launcher
  rofi-wayland
  rofi-emoji
  fuzzel
  
  # Screenshot tools
  grim
  slurp
  satty

  # Fonts
  ttf-dejavu 
  ttf-jetbrains-mono-nerd 
  ttf-ubuntu-font-family 
  noto-fonts 
  noto-fonts-cjk 
  noto-fonts-emoji 
  noto-fonts-extra 


  # Utils
  tldr
  bitwarden 
  bitwarden-cli 
  htop 
  base-devel 
  npm 
  python-pip 
  tree
  git 
  unrar 
  unzip 
  ripgrep 
  fzf
  composer 
  fd 
  bat 
  less
  rust 

  # Software
  libreoffice-fresh
  thunderbird
  firefox 
  ttyper

  # LF Support
  glow
   lf 
  imagemagick
  poppler
  bat 
  p7zip
  catdoc 
  docx2txt 
  odt2txt 
  fzf
  trash-cli # findutils

  # Qutebrowser Support
  qutebrowser 
  # yt-dlp 
  pdfjs
  python-adblock 
  python-tldextract

)


# List of AUR packages
aur_packages=(
  bibata-cursor-theme 
  papirus-linux-universe 
  mpris2controller-git 
  cp-p-git
  wdisplays
)

# Install packages from the official repositories
sudo pacman -Syu --noconfirm --needed "${official_packages[@]}"

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
