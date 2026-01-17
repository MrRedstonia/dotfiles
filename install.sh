#!/bin/bash

REPO_URL="https://github.com/MrRedstonia/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR/.git" ]; then
    echo "📂 Dotfiles repository not found locally."
    read -p "Would you like to clone the repository to $DOTFILES_DIR? (Y/n): " clone_now
    clone_now=${clone_now:-y}
    
    if [[ $clone_now == [yY]* ]]; then
        git clone "$REPO_URL" "$DOTFILES_DIR"
        cd "$DOTFILES_DIR" || exit 1
    else
        echo "❌ Cannot proceed without the source files. Exiting."
        exit 1
    fi
else

    cd "$DOTFILES_DIR" || exit 1
    echo "🔍 Checking for updates and file integrity..."
    git fetch origin main &>/dev/null
    
    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse @{u})
    
    if [ "$LOCAL" != "$REMOTE" ]; then
        echo "⚠️  Your local files are out of sync with GitHub."
        read -p "Would you like to pull the latest changes? (y/N): " pull_now
        pull_now=${pull_now:-n}
        [[ $pull_now == [yY]* ]] && git pull
    else
        echo "✅ Local files match GitHub."
    fi
fi

if [ -z "$BASH_VERSION" ]; then
    echo "⚠️  WARNING: This script was specifically designed for Bash."
    echo "Using other shells (zsh, fish, etc.) may result in errors."
    read -p "Do you want to proceed anyway? (y/N): " proceed
    proceed=${proceed:-n}
    [[ $proceed == [yY]* ]] || exit 1
fi

NECESSARY=(
    hyprland hypridle hyprlock waybar wofi bash pipewire 
    pipewire-pulse wireplumber pipewire-alsa polkit-kde-agent 
    swww kitty python tk
)

OPTIONAL=(
    starship git wl-clipboard grim slurp jq playerctl 
    pavucontrol network-manager-applet mangohud swaync 
    cliphist dolphin mission-center cpupower fastfetch 
    ttf-firacode-nerd noto-fonts-emoji ttf-dejavu mpvpaper librewolf-bin
)

echo "🔍 Auditing required packages..."
MISSING_REQUIRED=()
for pkg in "${NECESSARY[@]}"; do
    if ! pacman -Qs "^$pkg$" > /dev/null; then
        MISSING_REQUIRED+=("$pkg")
    fi
done

if [ ${#MISSING_REQUIRED[@]} -gt 0 ]; then
    echo "❌ ERROR: Essential packages are missing:"
    echo "   ${MISSING_REQUIRED[*]}"
    echo "Please install these before running this script."
    exit 1
fi

echo "✅ All essential packages found."

MISSING_OPTIONAL=()
for pkg in "${OPTIONAL[@]}"; do
    if ! pacman -Qs "^$pkg$" > /dev/null; then
        MISSING_OPTIONAL+=("$pkg")
    fi
done

if [ ${#MISSING_OPTIONAL[@]} -gt 0 ]; then
    echo "ℹ️  Some optional packages are missing: ${MISSING_OPTIONAL[*]}"
    read -p "Do you want to proceed anyway? (y/N): " proceed_opt
    proceed_opt=${proceed_opt:-n}
    if [[ $proceed_opt != [yY]* ]]; then
        echo "Installation cancelled."
        exit 1
    fi
fi

CONFIG_LIST=(MangoHud fastfetch hypr kitty starship swaync waybar wofi)
BACKUP_DIR="config-backup"

echo "📂 Processing .config folders..."
for folder in "${CONFIG_LIST[@]}"; do
    TARGET="$HOME/.config/$folder"
    if [ -d "$TARGET" ] && [ "$(ls -A "$TARGET")" ]; then
        echo "Backing up existing $folder config..."
        mkdir -p "$BACKUP_DIR"
        cp -r "$TARGET" "$BACKUP_DIR/"
        rm -rf "$TARGET"
    fi
done

echo "🚀 Deploying new configurations..."
mkdir -p "$HOME/.config"
cp -r ./config/. "$HOME/.config/"

echo "⚙️  Setting executable permissions for scripts..."
SCRIPTS=(
    "$HOME/.config/hypr/scripts/screenshot/region.sh"
    "$HOME/.config/hypr/scripts/screenshot/monitor.sh"
    "$HOME/.config/hypr/scripts/screenshot/window.sh"
    "$HOME/.config/hypr/scripts/screenshot/fullscreen.sh"
    "$HOME/.config/hypr/scripts/close.sh"
    "$HOME/.config/hypr/scripts/power_menu.sh"
    "$HOME/.config/hypr/scripts/power_restore.sh"
    "$HOME/.config/hypr/scripts/power_save.sh"
    "$HOME/.config/wofi/emoji-picker/emoji-picker.sh"
    "$HOME/.config/waybar/scripts/volume-toggle.sh"
)

for script in "${SCRIPTS[@]}"; do
    [ -f "$script" ] && chmod +x "$script"
done

if ! grep -q "starship init bash" "$HOME/.bashrc"; then
    echo "❓ Starship configuration not found in .bashrc."
    read -p "Would you like to add the Starship lines to your .bashrc? (Y/n): " add_star
    add_star=${add_star:-y}
    if [[ $add_star == [yY]* ]]; then
        cat <<EOF >> "$HOME/.bashrc"

# Starship Prompt
export STARSHIP_LOG=error
eval "\$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
EOF
        echo "✅ .bashrc updated."
    fi
fi

echo "------------------------------------------------"
echo "✨ Installation finished!"
read -p "Please press [Enter] to reboot"
sudo reboot
