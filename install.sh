#!/bin/bash

# Сolors
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

echo
echo "INSTALLING PACKAGES"

# Checking sudo
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Permission denied, please use sudo${RESET}"
   exit 1
fi

# Packages
packages=(
  hyprland
  brightnessctl
  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk
  wireplumber
  pipewire
  hyprpaper
  waybar
  otf-font-awesome
  wofi
  kitty
)

# Установка пакетов через pacman
for package in "${packages[@]}"; do
  echo
  echo "Installing: $package..."
  if pacman -Qi $package &>/dev/null; then
    echo -e "${GREEN}$package installed${RESET}"
  else
    sudo pacman -S --noconfirm $package
    if [[ $? -ne 0 ]]; then
      echo -e "${RED}install error $package.${RESET}"
      exit 1
    fi
  fi
done

: <<'EOF'

# Checking services
echo
echo -e "${GREEN}Checking xdg-desktop-portal-hyprland...${RESET}"
if systemctl --user is-enabled xdg-desktop-portal &>/dev/null; then
  echo -e "${GREEN}xdg-desktop-portal started.${RESET}"
else
  sudo -u "$SUDO_USER" systemctl --user enable --now xdg-desktop-portal
  echo -e "${GREEN}enable and start xdg-desktop-portal service.${RESET}"
fi

EOF

echo
echo -e "${GREEN}Installation is complete !${RESET}\n"
