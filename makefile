include config.mk

.PHONY: all hyprland clean check-dependencies

all: check-dependencies hyprland hyprpaper hypridle hyprlock xdph waybar programs utils drivers

check-dependencies:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Checking dependencies..."
	@command -v git &>/dev/null || { echo "$(RED)[MAKE][ERROR]$(RESET) git is not installed"; exit 1; }
	@command -v bash &>/dev/null || { echo "$(RED)[MAKE][ERROR]$(RESET) bash is not installed"; exit 1; }

hyprland:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprland..."
	@bash $(SCRIPTS_DIR)/install_hyprland.sh

hyprpaper:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprpaper..."
	@bash $(SCRIPTS_DIR)/install_hyprpaper.sh

hypridle:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hypridle..."
	@bash $(SCRIPTS_DIR)/install_hypridle.sh

hyprlock:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing hyprlock..."
	@bash $(SCRIPTS_DIR)/install_hyprlock.sh

xdph:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing xdph..."
	@bash $(SCRIPTS_DIR)/install_xdph.sh

waybar:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing waybar..."
	@bash $(SCRIPTS_DIR)/install_waybar.sh

programs:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing programs..."
	@bash $(SCRIPTS_DIR)/install_programs.sh

utils:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing utils..."
	@bash $(SCRIPTS_DIR)/install_utils.sh

drivers:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Installing drivers..."
	@bash $(SCRIPTS_DIR)/install_drivers.sh

clean:
	@echo
	@echo -e "$(YELLOW)[MAKE]$(RESET) Cleaning configurations..."
	@rm -rf $(INSTALL_DIR)/hypr || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete hypr"; exit 1; }
	@rm -rf $(INSTALL_DIR)/waybar || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete waybar"; exit 1; }
	@rm -rf $(INSTALL_DIR)/kitty || { echo "$(RED)[MAKE][ERROR]$(RESET) error delete kitty"; exit 1; }