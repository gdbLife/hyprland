#!/bin/bash

# logs
log() {
    local type=$1
    local message=$2
    case $type in
        info) echo -e "${YELLOW}[INSTALLER][INFO]${RESET} $message" ;;
        success) echo -e "${GREEN}[INSTALLER][SUCCESS]${RESET} $message" ;;
        error) echo -e "${RED}[INSTALLER][ERROR]${RESET} $message" ;;
        done) echo -e "${YELLOW}[INSTALLER][INFO]${RESET} ${GREEN}done${RESET}" ;;
    esac
}