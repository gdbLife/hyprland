My hyprland settings

Install Packages:

* hyprland
```bash
sudo pacman -S hyprland brightnessctl xdg-desktop-portal-hyprland
```
```bash
ln -f hypr/hyprland.conf                ~/.config/hypr/hyprland.conf
ln -f hypr/configs/appearance.conf      ~/.config/hypr/appearance.conf
ln -f hypr/configs/autostart.conf       ~/.config/hypr/autostart.conf
ln -f hypr/configs/environment.conf     ~/.config/hypr/environment.conf
ln -f hypr/configs/input.conf           ~/.config/hypr/input.conf
ln -f hypr/configs/keybindings.conf     ~/.config/hypr/keybindings.conf
ln -f hypr/configs/monitors.conf        ~/.config/hypr/monitors.conf
ln -f hypr/configs/programs.conf        ~/.config/hypr/programs.conf
ln -f hypr/configs/windows_and_workspaces.conf ~/.config/hypr/windows_and_workspaces.conf
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