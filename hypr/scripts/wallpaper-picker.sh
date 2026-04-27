#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"
LIST=""
for i in $(ls "$DIR"); do
    LIST+="$i\0icon\x1f$DIR/$i\n"
done

CHOICE=$(echo -e "$LIST" | rofi -dmenu -i -p "Gallery" -theme "$HOME/dotfiles/rofi/pywal.rasi" -show-icons)

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"
    
    # 1. Apply wallpaper
    awww img "$FULL_PATH" --transition-type grow --transition-pos top-right --transition-duration 2
    
    # 2. Generate colors
    wal -i "$FULL_PATH"
    
    # 3. FORCE colors into dotfiles (This is what you wanted)
    cp "$HOME/.cache/wal/colors-waybar.css" "$HOME/dotfiles/waybar/colors.css"
    
    # 4. Nuclear Restart
    pkill waybar
    sleep 0.3
    hyprctl dispatch exec waybar
    hyprctl reload
else
    exit 0
fi
