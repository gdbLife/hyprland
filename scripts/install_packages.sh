#!/bin/bash

# global variables
REP_ROOT="$(git rev-parse --show-toplevel)"
source ${REP_ROOT}/scripts/.env
module=$1

# logs
source ${REP_ROOT}/scripts/logs.sh

# install packages
function install_packages() {
    local packages=($(jq -r ".${module}.packages[]" ${REP_ROOT}/setup.json))

    log info "Installing packages..."
    
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &>/dev/null; then
            log success "$package is already installed"
        else
            log info "Installing $package..."
            sudo pacman -S --noconfirm "$package" && log success "$package installed" || { log error "failed to install $package"; exit 1; }
        fi
    done
}

install_packages