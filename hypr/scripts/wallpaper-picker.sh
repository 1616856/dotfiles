#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"
LIST=""
for i in $(ls "$DIR"); do
    LIST+="$i\0icon\x1f$DIR/$i\n"
done

CHOICE=$(echo -e "$LIST" | rofi -dmenu -i -p "Gallery" -theme "$HOME/dotfiles/rofi/wallpaper-grid.rasi" -show-icons)

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"
    awww img "$FULL_PATH"
    wal -i "$FULL_PATH"
    hyprctl reload
    killall -SIGUSR2 waybar
else
    exit 0
fi
