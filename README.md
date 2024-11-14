My hyprland settings

Install Packages:

* hyprland-git
```bash
yay -S hyprland-git
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

* waybar-git
```bash
yay -S waybar-git otf-font-awesome
```
```bash
ln -f waybar/config.jsonc   ~/.config/waybar/config.jsonc
ln -f waybar/style.css      ~/.config/waybar/style.css
```

* wofi
```bash
yay -S wofi
```

* kitty
```bash
yay -S kitty
```
```bash
ln -f kitty/kitty.conf  ~/.config/kitty/kitty.conf
```