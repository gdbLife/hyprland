#!/bin/bash

REP_ROOT="$(git rev-parse --show-toplevel)"
source ${REP_ROOT}/scripts/.env

# logs
log() {
    local type=$1
    local message=$2
    case $type in
        info) echo -e "${YELLOW}[INSTALLER][INFO]${RESET} $message" ;;
        success) echo -e "${GREEN}[INSTALLER][SUCCESS]${RESET} $message" ;;
        error) echo -e "${RED}[INSTALLER][ERROR]${RESET} $message" ;;
    esac
}

# checking commands
commands=(pacman mkdir ln)
for cmd in ${commands[@]}; do
    command -v "$cmd" &>/dev/null || { log error "$cmd is not installed"; exit 1; }
done

# packages
packages=(
    waybar
    otf-font-awesome
    power-profiles-daemon
)

# install packages
log info "Installing packages..."
install_package() {
    local package=$1
    if pacman -Qi "$package" &>/dev/null; then
        log success "$package is already installed"
    else
        log info "Installing $package..."
        if sudo pacman -S --noconfirm "$package"; then
            log success "$package installed"
        else
            log error "failed to install $package"
            exit 1
        fi
    fi
}
for package in ${packages[@]}; do
    install_package "$package"
done

# configuration
log info "Installing configs..."
if [[ ! -d "${INSTALL_DIR}/waybar" ]]; then
    mkdir -p "${INSTALL_DIR}/waybar" || { log error "failed to create directory"; exit 1; }
    log success "created dir ~/.config/waybar"
fi

ln -sf "${CONFIGS_DIR}/waybar/config.jsonc" "${INSTALL_DIR}/waybar/config.jsonc"
ln -sf "${CONFIGS_DIR}/waybar/style.css" "${INSTALL_DIR}/waybar/style.css"
log success "configs installed"
