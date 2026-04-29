# --- 1. Refresh Package Databases ---
echo "Refreshing mirrors and updating system..."
sudo pacman -Syu --noconfirm

# --- 2. Install Packages (Correct Names) ---
echo "Installing the Estate's engine..."
sudo pacman -S --needed --noconfirm \
    base-devel git kitty waybar rofi-wayland yazi \
    grim slurp wl-clipboard cliphist stow \
    pamixer playerctl swww python-pywal \
    noto-fonts noto-fonts-emoji noto-fonts-cjk \
    prismlauncher micro jq

# --- 3. Linking & Initialization ---
echo "Linking configurations and templates..."
cd ~/dotfiles
stow hypr waybar rofi wal kitty wal-templates

# --- 4. The Final Kickstart ---
echo "Baking initial colors..."
# This creates the .cache files so the red error bar disappears
wal -i ~/dotfiles/wallpapers/ -q

chmod +x ~/dotfiles/hypr/scripts/*
echo "Estate deployed successfully."
