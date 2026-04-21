#!/bin/bash

# --- 1. Update System ---
echo "Updating system..."
sudo pacman -Syu --noconfirm

# --- 2. Install Pacman Packages (The Essentials) ---
echo "Installing Pacman packages..."
sudo pacman -S --needed --noconfirm \
    base-devel git kitty waybar rofi thunar \
    grim slurp wl-clipboard cliphist \
    pamixer playerctl swww python-pywayland \
    noto-fonts noto-fonts-emoji noto-fonts-cjk \
    prismlauncher  # Prism is now in the official Extra repo!

# --- 3. Install Yay (AUR Helper) if not present ---
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm && cd -
fi

# --- 4. Install AUR Packages (Fonts & Vesktop) ---
echo "Installing AUR packages..."
yay -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd \
    vazirmatn-fonts \
    vesktop-bin \
    rofi-bluetooth-git \
    awww-git

# --- 5. Setup Symlinks (The Omar Estate Structure) ---
echo "Linking configurations..."
mkdir -p ~/.config
ln -sf ~/dotfiles/hypr ~/.config/
ln -sf ~/dotfiles/waybar ~/.config/
ln -sf ~/dotfiles/kitty ~/.config/
ln -sf ~/dotfiles/rofi ~/.config/

# --- 6. Final Polish ---
chmod +x ~/dotfiles/hypr/scripts/*.sh
fc-cache -fv  # Refresh fonts

echo "Olive Oil config downloaded."
