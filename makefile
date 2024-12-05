include config.mk

.PHONY: all hyprland clean check-dependencies

all: check-commands hyprland hyprpaper hypridle hyprlock xdph wofi waybar programs utils drivers

check-commands:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Checking commands..."
	@bash $(SCRIPTS_DIR)/check_commands.sh

hyprland:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprland..."
	@bash $(SCRIPTS_DIR)/install_packages.sh hyprland
	@bash $(SCRIPTS_DIR)/install_configs.sh hyprland

hyprpaper:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprpaper..."
	@bash $(SCRIPTS_DIR)/install_packages.sh hyprpaper
	@bash $(SCRIPTS_DIR)/install_configs.sh hyprpaper

hypridle:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hypridle..."
	@bash $(SCRIPTS_DIR)/install_packages.sh hypridle
	@bash $(SCRIPTS_DIR)/install_configs.sh hypridle

hyprlock:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprlock..."
	@bash $(SCRIPTS_DIR)/install_packages.sh hyprlock
	@bash $(SCRIPTS_DIR)/install_configs.sh hyprlock

xdph:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing xdph..."
	@bash $(SCRIPTS_DIR)/install_packages.sh xdph
	@bash $(SCRIPTS_DIR)/install_configs.sh xdph

wofi:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing wofi..."
	@bash $(SCRIPTS_DIR)/install_packages.sh wofi

waybar:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing waybar..."
	@bash $(SCRIPTS_DIR)/install_packages.sh waybar
	@bash $(SCRIPTS_DIR)/install_configs.sh waybar

programs:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing programs..."
	@bash $(SCRIPTS_DIR)/install_packages.sh programs
	@bash $(SCRIPTS_DIR)/install_configs.sh programs

utils:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing utils..."
	@bash $(SCRIPTS_DIR)/install_packages.sh utils
	@bash $(SCRIPTS_DIR)/configurations/utils.sh

drivers:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing drivers..."
	@bash $(SCRIPTS_DIR)/install_packages.sh drivers

clean:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Cleaning configurations..."
	@rm -rf $(INSTALL_DIR)/hypr || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete hypr"; exit 1; }
	@rm -rf $(INSTALL_DIR)/waybar || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete waybar"; exit 1; }
	@rm -rf $(INSTALL_DIR)/kitty || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete kitty"; exit 1; }