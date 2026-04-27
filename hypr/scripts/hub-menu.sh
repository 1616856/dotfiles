#!/bin/bash

DOTFILES="$HOME/dotfiles"

options="󰖩 Network\n󰂯 Bluetooth\n󰸉 Wallpapers"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "System Control" \
    -show-icons \
    -theme "$DOTFILES/rofi/pywal.rasi")

case $chosen in
    *Network)
        bash "$DOTFILES/scripts/networkmanager_dmenu.sh" ;;
        
    *Bluetooth)
        rofi-bluetooth ;;
        
    *Wallpapers)
        bash "$DOTFILES/hypr/scripts/wallpaper-picker.sh" ;;
esac
