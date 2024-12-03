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
    kitty
    thunar
    lite-xl
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
dirs=(kitty)
for dir in ${dirs[@]}; do
    if [[ ! -d "${INSTALL_DIR}/$dir" ]]; then
        mkdir -p "${INSTALL_DIR}/$dir" || { log error "failed to create $dir directory"; exit 1; }
        log success "created dir ~/.config/$dir"
    fi
done

ln -sf "${CONFIGS_DIR}/programs/kitty/kitty.conf" "${INSTALL_DIR}/kitty/kitty.conf"
log success "configs installed"
