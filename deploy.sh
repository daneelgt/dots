#!/usr/bin/env bash

set -euo pipefail

echo "📂 Instalando dotfiles..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/Pictures"

for dir in fastfetch ghostty hypr kitty nvim rofi waybar; do
    if [ -d "$dir/.config" ]; then
        echo "→ $dir"
        rsync -a "$dir/.config/" "$HOME/.config/"
    fi
done

echo "→ ZSH"
cp -f .zshrc "$HOME/.zshrc"

echo "→ Wallpapers"
rsync -a Pictures/ "$HOME/Pictures/"

echo "✅ Dotfiles instalados."
