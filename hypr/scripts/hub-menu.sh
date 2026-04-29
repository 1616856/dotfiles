#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Use the new wallpaper-grid theme for a more "hub" look if you prefer, 
# or keep pywal.rasi for a slim list.
THEME="$DOTFILES/rofi/pywal.rasi"

options="󰖩 Network\n󰂯 Bluetooth\n󰸉 Wallpapers"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "System Control" \
    -show-icons \
    -theme "$THEME")

# Use lowercase and trim for more reliable matching
case "$(echo "$chosen" | tr '[:upper:]' '[:lower:]')" in
    *network*)
        # Executing directly is cleaner than 'bash path/to/script' 
        # as long as the scripts are chmod +x
        "$DOTFILES/hypr/scripts/networkmanager_dmenu.sh" &
        ;;
    *bluetooth*)
        rofi-bluetooth -theme "$DOTFILES/rofi/pywal.rasi" &
        ;;
    *wallpapers*)
        "$DOTFILES/hypr/scripts/wallpaper-picker.sh" &
        ;;
    *)
        exit 0
        ;;
esac
