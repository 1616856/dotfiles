#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"
CHOICE=$(ls "$DIR" | rofi -dmenu -i -p "Select Wallpaper")

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"

    # 1. Set Wallpaper
    awww img "$FULL_PATH" --transition-type grow --transition-pos top-right

    # 2. Generate Colors (Silent mode)
    wal -i "$FULL_PATH" -q

    # 3. Update Vesktop (Discord)
    pywal-discord -p

    # 4. Refresh Waybar & Hyprland
    killall -SIGUSR2 waybar
    hyprctl reload

    # 5. Save for reboot
    echo "$FULL_PATH" > "$HOME/.cache/.last_wallpaper"
fi
