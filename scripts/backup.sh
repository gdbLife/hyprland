#!/bin/bash

source .env

if [[ ! -d "{$INSTALL_DIR}/hypr/modules" ]]; then
	mkdir -p ${INSTALL_DIR}/hypr/modules
fi

echo -e "${GREEN}Installing Hyprland configs...${RESET}"
mkdir -p ~/.config/hypr/configs
cp -f ${CONFIGS_DIR}/hyprland/hyprland.conf             ${INSTALL_DIR}/hypr/hyprland.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/appearance.conf   ${INSTALL_DIR}/hypr/modules/appearance.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/autostart.conf    ${INSTALL_DIR}/hypr/modules/autostart.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/environment.conf  ${INSTALL_DIR}/hypr/modules/environment.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/input.conf        ${INSTALL_DIR}/hypr/modules/input.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/keybindings.conf  ${INSTALL_DIR}/hypr/modules/keybindings.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/monitors.conf     ${INSTALL_DIR}/hypr/modules/monitors.conf
cp -f ${CONFIGS_DIR}/hyprland/modules/windows.conf      ${INSTALL_DIR}/hypr/modules/windows.conf
