#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"

# Build the Gallery list
LIST=""
for i in $(ls "$DIR"); do
    LIST+="$i\0icon\x1f$DIR/$i\n"
done

# The sleek Gallery menu
CHOICE=$(echo -e "$LIST" | rofi -dmenu -i -p "Gallery" \
    -theme "$HOME/dotfiles/rofi/wallpaper-grid.rasi" \
    -show-icons)

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"
    
    # 1. Update the image using awww
    awww img "$FULL_PATH"
    
    # 2. Update the theme using wal
    # -q: quiet (no terminal output)
    # -i: path to image
    wal -q -i "$FULL_PATH"
    
    # 3. Force the UI components to refresh
    # Reloads Hyprland for new border colors
    hyprctl reload
    # Refresh Waybar colors
    killall -SIGUSR2 waybar
    
    # Optional: If you still have the Discord theme, add it here
    # pywal-discord
else
    exit 0
fi
