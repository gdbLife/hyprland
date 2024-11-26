#!/bin/bash

# Colors
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

echo
echo "INSTALLING CONFIGS"
echo


### HYPRLAND ###


echo -e "${GREEN}Installing Hyprland configs...${RESET}"

mkdir -p ~/.config/hypr/configs
ln -sf $(pwd)/hypr/hyprland.conf               ~/.config/hypr/hyprland.conf
ln -sf $(pwd)/hypr/configs/appearance.conf     ~/.config/hypr/configs/appearance.conf
ln -sf $(pwd)/hypr/configs/autostart.conf      ~/.config/hypr/configs/autostart.conf
ln -sf $(pwd)/hypr/configs/environment.conf    ~/.config/hypr/configs/environment.conf
ln -sf $(pwd)/hypr/configs/input.conf          ~/.config/hypr/configs/input.conf
ln -sf $(pwd)/hypr/configs/keybindings.conf    ~/.config/hypr/configs/keybindings.conf
ln -sf $(pwd)/hypr/configs/monitors.conf       ~/.config/hypr/configs/monitors.conf
ln -sf $(pwd)/hypr/configs/programs.conf       ~/.config/hypr/configs/programs.conf
ln -sf $(pwd)/hypr/configs/windows.conf        ~/.config/hypr/configs/windows.conf


### XDPH ###


echo -e "${GREEN}Installing XDPH configs...${RESET}"

ln -sf $(pwd)/hypr/xdph.conf        ~/.config/hypr/xdph.conf


### HYPRPAPER ###


echo -e "${GREEN}Installing Hyprpaper configs...${RESET}"

ln -sf $(pwd)/hypr/hyprpaper.conf   ~/.config/hypr/hyprpaper.conf


### WAYBAR ###


echo -e "${GREEN}Installing Waybar configs...${RESET}"

mkdir -p ~/.config/waybar
ln -sf $(pwd)/waybar/config.jsonc   ~/.config/waybar/config.jsonc
ln -sf $(pwd)/waybar/style.css      ~/.config/waybar/style.css


### PROGRAMS ###


echo -e "${GREEN}Installing Kitty configs...${RESET}"

mkdir -p ~/.config/kitty
ln -sf $(pwd)/programs/kitty/kitty.conf     ~/.config/kitty/kitty.conf


### UTILS ###


echo -e "${GREEN}Creating and setting users dirs...${RESET}"

cat <<EOL > ~/.config/user-dirs.dirs
XDG_DESKTOP_DIR="\$HOME/desktop"
XDG_DOWNLOAD_DIR="\$HOME/downloads"
XDG_DOCUMENTS_DIR="\$HOME/documents"
XDG_MUSIC_DIR="\$HOME/music"
XDG_PICTURES_DIR="\$HOME/pictures"
XDG_VIDEOS_DIR="\$HOME/videos"
XDG_TEMPLATES_DIR="\$HOME/templates"
XDG_PUBLICSHARE_DIR="\$HOME/public"
EOL
mkdir -p ~/desktop ~/downloads ~/documents ~/music ~/pictures ~/videos ~/templates ~/public
xdg-user-dirs-update



echo
echo -e "${GREEN}Configuration is complete!${RESET}"
