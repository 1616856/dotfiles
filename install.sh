# --- 2. Install Pacman Packages ---
echo "Installing Pacman packages..."
sudo pacman -S --needed --noconfirm \
    base-devel git kitty waybar rofi thunar \
    grim slurp wl-clipboard cliphist \
    pamixer playerctl swww python-pywayland \
    noto-fonts noto-fonts-emoji noto-fonts-cjk \
    prismlauncher micro  # Added micro here

# --- 4.5 Setup Wallpaper Directory & Sync ---
echo "Setting up wallpapers..."
# Create the actual folder in your repo if it's not there
mkdir -p ~/dotfiles/wallpapers

# Create the system Pictures folder
mkdir -p ~/Pictures/Wallpapers

# Copy your current papers into the repo so they can be uploaded to GitHub
cp ~/Pictures/Wallpapers/* ~/dotfiles/wallpapers/ 2>/dev/null

# Link the repo wallpapers to your system Pictures folder
# This makes it so if you add a wallpaper to the repo, it shows up in your picker
ln -sf ~/dotfiles/wallpapers/* ~/Pictures/Wallpapers/

# --- NEW: Setup Pywal Templates ---
echo "Linking Pywal templates..."
mkdir -p ~/.config/wal/templates

# This links your repo templates to the place Pywal expects them
ln -sf ~/dotfiles/wal-templates/* ~/.config/wal/templates/

# --- NEW: Initial Theme Generation ---
# This fixes the "color1 not found" error by picking the first wallpaper
if [ -d "~/dotfiles/wallpapers" ]; then
    wal -i ~/dotfiles/wallpapers/ -q
fi
