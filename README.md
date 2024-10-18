
# My Hyprland config

## Screenshots

![lockscreen](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/1.png)
![overview](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/2.png)
![app launcher](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/3.png)

## Installation (Arch linux)

Install packages with pacman
```bash
sudo pacman -S adwaita-icon-theme blueman breeze git hyprland hyprpaper imv kitty mpv neofetch noto-fonts-emoji qt5ct qt6ct swayidle thunar waybar wofi zsh
```
Install remaining packages with yay
```bash
yay -S cava hyprshot oh-my-zsh peaclock swaylock-effects
```
Clone the repository
```bash
git clone https://github.com/Catwallon/hyprland-catwallon.git
```
Copy all the config files in your home directory
```bash
cp -r hyprland-catwallon/* $HOME
```
Reboot your computer
```bash
reboot
```
Done !
