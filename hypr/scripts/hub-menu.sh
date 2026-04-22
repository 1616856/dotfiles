export PATH=$PATH:/usr/local/bin:/usr/bin
#!/bin/bash
options="󰖩 Network\n󰂯 Bluetooth\n󰸉 Wallpapers"
chosen=$(echo -e "$options" | rofi -dmenu -i -p "System Control" \
    -show-icons \
    -theme "~/dotfiles/rofi/pywal.rasi")
case $chosen in
    *Network)
        /usr/bin/networkmanager_dmenu ;;
        
    *Bluetooth)
        rofi-bluetooth ;;
        
    *Wallpapers)
        # Use the dotfiles path!
        bash ~/dotfiles/hypr/scripts/wallpaper-picker.sh ;;
esac
