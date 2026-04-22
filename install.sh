# --- 2. Install Pacman Packages ---
echo "Installing everything..."
sudo pacman -S --needed --noconfirm \
    base-devel git kitty waybar rofi-wayland thunar \
    grim slurp wl-clipboard cliphist stow \
    pamixer playerctl swww python-pywal \
    noto-fonts noto-fonts-emoji noto-fonts-cjk \
    prismlauncher micro jq

# --- 3. The "Auto-Link" Step ---
echo "Linking configurations..."
cd ~/dotfiles
stow hypr waybar rofi wal kitty templates

# --- 4. The "Jumpstart" (The missing piece) ---
echo "Baking initial colors so Hyprland doesn't error out..."
# We run wal on the folder to create the .cache files immediately
wal -i ~/dotfiles/wallpapers/ -q

# Make sure all scripts can run
chmod +x ~/dotfiles/hypr/scripts/*
