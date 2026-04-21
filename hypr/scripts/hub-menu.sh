#!/bin/bash
options="󰂯 Bluetooth\n󰸉 Wallpapers"
chosen=$(echo -e "$options" | rofi -dmenu -p "System Control" -i -theme-str 'window {width: 20%;}')

case $chosen in
    *Bluetooth)
        rofi-bluetooth ;;
    *Wallpapers)
        bash ~/.config/hypr/scripts/wallpaper-picker.sh ;;
esac
