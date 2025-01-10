
# My Hyprland config

## Screenshots

![lockscreen](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/1.png)
![overview](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/2.png)
![app launcher](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/3.png)
![firefox](https://raw.github.com/Catwallon/hyprland-catwallon/master/screenshots/4.png)

## Installation (Arch linux)

Install packages with pacman
```bash
sudo pacman -Syu acpi adwaita-icon-theme blueman breeze brightnessctl cmake cpio curl git hyprland hyprpaper imv kitty mpv neofetch noto-fonts-emoji qt5ct qt6ct swayidle thunar waybar wofi zsh
```
Install remaining packages with yay
```bash
yay -Syu cava hyprshot peaclock swaylock-effects
```
Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
Install the plugins
```bash
hyprpm update
hyprpm add https://github.com/alexhulbert/Hyprchroma
hyprpm enable hyprchroma
```
Clone the repository
```bash
git clone https://github.com/Catwallon/hyprland-catwallon.git
```
Copy all the config files in your home directory
```bash
cp -r hyprland-catwallon/.* $HOME
```
Reboot your computer
```bash
reboot
```
Done !
