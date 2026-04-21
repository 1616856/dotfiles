#!/bin/bash
awww-daemon &
sleep 0.5
CACHE="$HOME/.cache/.last_wallpaper"
if [ -f "$CACHE" ]; then
    awww img "$(cat "$CACHE")"
else
    awww img "$HOME/Pictures/Wallpapers/default.jpg"
fi
