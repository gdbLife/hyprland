# Hyprland Configuration and Installation

This repository contains configurations and installation scripts for setting up a Hyprland-based environment. It includes packages, configurations for various tools, and utilities to enhance the Hyprland desktop experience.

## Project Structure

- **configs**: Contains configuration files for Hyprland, Hyprlock, Hyprpaper, Waybar, and various other programs.
- **scripts**: Contains bash scripts to install and configure the necessary packages and tools for your system.
- **makefile**: Used to automate installation and configuration tasks.
- **setup**: File used for settings install

## Features

This repository includes the following key features:

#### Hyprland Environment

- **hyprland**: A dynamic tiling Wayland compositor.
- **hyprpaper**: Wallpaper management tool for Hyprland.
- **hyprlock**: Screen locking utility for Hyprland.
- **hypridle**: Manage idle time and lock screens based on inactivity.
- **xdg-desktop-portal-hyprland**: xdg-desktop-portal backend for hyprland
- **waybar**: A customizable status bar for Wayland compositors.
- **wofi**: A Wayland-native application launcher.

#### Programs and Utilities

- **kitty**: A fast, feature-rich terminal emulator.
- **thunar**: File manager.
- **lite-xl**: Lightweight text editor.
- **vscode**: Visual Studio Code editor.
- **xdg-user-dirs**: Tools to handle user directories.

#### Drivers

- **pipewire**: Low-latency audio/video router and processor

## Installation

The `make` will install all the required packages for the Hyprland environment and its configs.

```bash
make all
```

## Clean Up

You can clean up the setup if needed by running the `clean` command in the Makefile:

```bash
make clean
```

This will remove the configuration directories and reset your environment.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.