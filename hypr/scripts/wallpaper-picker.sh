#!/bin/bash
DIR="$HOME/dotfiles/wallpapers"

IMG_LIST=""
for img in "$DIR"/*.{jpg,jpeg,png,webp}; do
    [ -f "$img" ] && IMG_LIST+="$(basename "$img")\0icon\x1f$img\n"
done

SEL=$(echo -e "$IMG_LIST" | rofi -dmenu -p "Select Wallpaper" -i -show-icons -theme-str 'listview {columns: 3; lines: 2;} element {orientation: vertical;} element-icon {size: 120px;}')

if [ -n "$SEL" ]; then
    # Save the full path to a hidden file for next boot
    echo "$DIR/$SEL" > "$HOME/.cache/.last_wallpaper"
    
    # Set it now
    awww img "$DIR/$SEL"
fi
