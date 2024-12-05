#!/bin/bash

# global variables
REP_ROOT="$(git rev-parse --show-toplevel)"
source ${REP_ROOT}/scripts/.env
module=$1

# logs
source ${REP_ROOT}/scripts/logs.sh

# install configs
function install_configs() {
    local configs_paths=($(jq -r "(try .${module}.configs_paths.main[]?), (try .${module}.configs_paths.modules[]?)" ${REP_ROOT}/setup.json))
    local install_paths=($(jq -r "(try .${module}.install_paths.main[]?), (try .${module}.install_paths.modules[]?)" ${REP_ROOT}/setup.json | sed "s|~|$HOME|g"))
     
    log info "Installing configs..."

    for i in "${!install_paths[@]}"; do
        path="${install_paths[$i]}"
        config="${configs_paths[$i]}"
        dir_name="$(dirname "$path")"
        config_name="$(basename "$path")"
        if [[ ! -d "$dir_name" ]]; then
            mkdir -p ${dir_name}
        fi
        ln -sf ${CONFIGS_DIR}/${config} ${path}
        log success "created $path"
    done
}

install_configs