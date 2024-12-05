#!/bin/bash

# global variables
REP_ROOT="$(git rev-parse --show-toplevel)"
source ${REP_ROOT}/scripts/.env

# logs
source ${REP_ROOT}/scripts/logs.sh

# check commands
commands=(git bash pacman mkdir ln)
for cmd in ${commands[@]}; do
    command -v "$cmd" &>/dev/null || { log error "$cmd is not installed"; exit 1; }
done
log success "done"