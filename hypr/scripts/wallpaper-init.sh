# If no last wallpaper is found, pick the Sand Kitten from the repo
if [ ! -f ~/.cache/.last_wallpaper ]; then
    echo "$HOME/dotfiles/wallpapers/Curious_Sand_Kitten.jpg" > ~/.cache/.last_wallpaper
fi

# Start swww and load the image
swww init
swww img $(cat ~/.cache/.last_wallpaper)
