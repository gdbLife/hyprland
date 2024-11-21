My hyprland settings

Install Packages:

* hyprland
```bash
sudo pacman -S hyprland brightnessctl
```
```bash
ln -f hyprland.conf             ~/.config/hypr/hyprland.conf
ln -f hypr/appearance.conf      ~/.config/hypr/appearance.conf
ln -f hypr/autostart.conf       ~/.config/hypr/autostart.conf
ln -f hypr/environment.conf     ~/.config/hypr/environment.conf
ln -f hypr/input.conf           ~/.config/hypr/input.conf
ln -f hypr/keybindings.conf     ~/.config/hypr/keybindings.conf
ln -f hypr/monitors.conf        ~/.config/hypr/monitors.conf
ln -f hypr/programs.conf        ~/.config/hypr/programs.conf
ln -f hypr/windows_and_workspaces.conf ~/.config/hypr/windows_and_workspaces.conf
```

* waybar
```bash
sudo pacman -S waybar otf-font-awesome
```
```bash
ln -f waybar/config.jsonc   ~/.config/waybar/config.jsonc
ln -f waybar/style.css      ~/.config/waybar/style.css
```

* wofi
```bash
sudo pacman -S wofi
```

* kitty
```bash
sudo pacman -S kitty
```
```bash
ln -f kitty/kitty.conf  ~/.config/kitty/kitty.conf
```