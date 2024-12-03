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
    xdg-user-dirs
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
log info "Creating and setting users dirs..."
if [[ ! -f ${INSTALL_DIR}/user-dirs.dirs ]]; then
cat <<EOL > ${INSTALL_DIR}/user-dirs.dirs
XDG_DESKTOP_DIR="\$HOME/desktop"
XDG_DOWNLOAD_DIR="\$HOME/downloads"
XDG_DOCUMENTS_DIR="\$HOME/documents"
XDG_MUSIC_DIR="\$HOME/music"
XDG_PICTURES_DIR="\$HOME/pictures"
XDG_VIDEOS_DIR="\$HOME/videos"
XDG_TEMPLATES_DIR="\$HOME/templates"
XDG_PUBLICSHARE_DIR="\$HOME/public"
EOL
fi
dirs=(desktop downloads documents music pictures videos templates public)
for dir in ${dirs[@]}; do
    if [[ ! -d $HOME/$dir ]]; then
        mkdir -p $HOME/$dir || { log error "failed to create $dir directory"; exit 1; }
        log success "created dir $HOME/$dir"
    fi
done
xdg-user-dirs-update
log success "configs installed"
