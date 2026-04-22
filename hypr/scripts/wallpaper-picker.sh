#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"
CHOICE=$(ls "$DIR" | rofi -dmenu -i -p "Select Wallpaper")

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"
    # Set the wallpaper using awww
    awww img "$FULL_PATH" --transition-type grow --transition-pos top-right
    # Save for next reboot
    echo "$FULL_PATH" > "$HOME/.cache/.last_wallpaper"
fi
