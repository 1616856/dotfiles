#!/usr/bin/env bash

DIR="$HOME/dotfiles/wallpapers"
LIST=""

# 1. Build the list reliably (handles spaces in filenames)
for i in "$DIR"/*; do
    if [ -f "$i" ]; then
        filename=$(basename "$i")
        LIST+="$filename\0icon\x1f$i\n"
    fi
done

# 2. Open Rofi Gallery
CHOICE=$(echo -e "$LIST" | rofi -dmenu -i -p "Gallery" -theme "$HOME/dotfiles/rofi/wallpaper-grid.rasi" -show-icons)

if [ -n "$CHOICE" ]; then
    FULL_PATH="$DIR/$CHOICE"
    
    # 3. Apply wallpaper with awww
    awww img "$FULL_PATH" --transition-type grow --transition-pos top-right --transition-duration 2
    
    # 4. Generate colors with pywal
    wal -i "$FULL_PATH"
    
    # 5. Sync colors to dotfiles
    cp "$HOME/.cache/wal/colors-waybar.css" "$HOME/dotfiles/waybar/colors.css"
    cp "$HOME/.cache/wal/colors-rofi-dark.rasi" "$HOME/dotfiles/rofi/colors.rasi"
    
    # 6. The "Bulletproof" Restart
    # Kill any existing instances
    killall -q waybar
    
    # Wait until they are actually gone
    while pgrep -u $USER -x waybar >/dev/null; do sleep 0.1; done
    
    # Launch Waybar and detach it completely from the script
    waybar > /dev/null 2>&1 & 
    disown
    
    # Optional: Reload Hyprland to ensure window gaps/borders update if they use pywal
    hyprctl reload
else
    exit 0
fi
