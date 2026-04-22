#!/usr/bin/env bash

# 1. Start the awww daemon if it's not running
if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    sleep 1.5 # Macs sometimes need a bit more time to wake the GPU
fi

CACHE_FILE="$HOME/.cache/.last_wallpaper"
DEFAULT_WP="$HOME/dotfiles/wallpapers/Curious_Sand_Kitten.jpg"

# 2. Restore the last wallpaper using awww
if [ -f "$CACHE_FILE" ]; then
    awww img "$(cat "$CACHE_FILE")" --transition-type simple
else
    awww img "$DEFAULT_WP" --transition-type simple
    echo "$DEFAULT_WP" > "$CACHE_FILE"
fi
