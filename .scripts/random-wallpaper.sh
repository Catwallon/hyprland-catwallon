#!/bin/sh

RANDOM_WALLPAPER=$(find "$HOME/.wallpapers" -type f | shuf -n 1)

ln -sf "$RANDOM_WALLPAPER" "$HOME/.wallpapers/wallpaper.jpg"
