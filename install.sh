#!/bin/bash

set -e

echo "Thank you for using my Awesome window manager dots!"
echo ""

echo "Checking if dependencies are already installed..."
dependencies=("awesome" "git" "kitty" "network-manager-applet" "numlockx" "picom" "polkit-gnome" "rofi" "scrot" "vicious")
missing_dependencies=()

for dependency in "${dependencies[@]}"; do
    if ! pacman -Qs "$dependency" >/dev/null; then
        missing_dependencies+=("$dependency")
    fi
done

if [ "${#missing_dependencies[@]}" -gt 0 ]; then
    echo "Installing missing dependencies: ${missing_dependencies[*]}"
    sudo pacman -Syu
    sudo pacman -S --needed "${missing_dependencies[@]}"
else
    echo "All dependencies are already installed."
fi

echo ""
echo "Installing default applications..."
sudo pacman -S --needed firefox neovim

echo ""
echo "Creating backup of old configuration files..."

echo "Awesome Window Manager..."
if [ -d ~/.config/awesome ]; then
    mv ~/.config/awesome ~/.config/awesome.bak
    echo "Backed up ~/.config/awesome to ~/.config/awesome.bak"

else
    echo "Configuration files not found, skipping..."
fi

echo "Neovim..."
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.bak
    echo "Backed up ~/.config/nvim to ~/.config/nvim.bak"

else
    echo "Configuration files not found, skipping..."
fi

echo "Picom..."
if [ -d ~/.config/picom ]; then
    mv ~/.config/picom ~/.config/picom.bak
    echo "Backed up ~/.config/picom to ~/.config/picom.bak"

else
    echo "Configuration files not found, skipping..."
fi

echo "Rofi..."
if [ -d ~/.config/rofi ]; then
    mv ~/.config/rofi ~/.config/rofi.bak
    echo "Backed up ~/.config/rofi to ~/.config/rofi.bak"

else
    echo "Configuration files not found, skipping..."
fi

echo ""
echo "Downloading configuration files..."

git clone https://github.com/Empyrean-Void/Awesome.git ~/.config/awesome/

git clone https://github.com/Empyrean-Void/Neovim.git ~/.config/nvim/

git clone https://github.com/Empyrean-Void/Picom.git ~/.config/picom/

git clone https://github.com/Empyrean-Void/Rofi.git ~/.config/rofi/

echo ""
echo "Installation finished!"
