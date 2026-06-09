# 💻 Dotfiles
![GitHub stars](https://img.shields.io/github/stars/daneelgt/dots?style=social)
![GitHub forks](https://img.shields.io/github/forks/daneelgt/dots?style=social)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)


## stack

| componente | uso |
|---|---|
| **Hyprland** | window manager (Wayland, NVIDIA) |
| **Waybar** | status bar floating no topo |
| **Rofi (rofi-wayland)** | launcher (drun, run, window) |
| **Kitty** | terminal emulator |
| **Yazi** | file manager TUI com previews |
| **Nautilus** | file manager |
| **swww** | wallpaper engine animado |
| **Zsh** | shell |

## instalação

```sh
git clone https://github.com/daneelgt/dots.git
cd dots

chmod +x deploy.sh install.sh

./deploy.sh
./install.sh
```


## keybinds principais

| atalho | ação |
|---|---|
| `SUPER + Enter` | terminal (kitty) |
| `SUPER + R` | launcher (rofi) |
| `SUPER + E` | file manager (yazi) |
| `SUPER + T` | file manager (nautilus) |
| `SUPER + B` | browser (firefox) |
| `SUPER + Q` | fechar janela |
| `SUPER + V` | toggle floating |
| `SUPER + F` | fullscreen |
| `SUPER + G` | toggle gamemode |
| `SUPER + W` | próximo wallpaper |
| `SUPER + SHIFT + S` / `Print` | screenshot área |
| `SHIFT + Print` | screenshot full |
| `SUPER + Print` | screenshot janela ativa |
| `SUPER + SHIFT + V` | clipboard (cliphist) |
| `SUPER + h/j/k/l` | mover foco (vim-like) |
| `SUPER + SHIFT + h/j/k/l` | mover janela |
| `SUPER + CTRL + setas` | redimensionar |
| `SUPER + 1-9` | workspace |
| `SUPER + SHIFT + 1-9` | mover janela pro workspace |


## estrutura

```
~/dots/
├── hypr/      → ~/.config/hypr/
├── waybar/    → ~/.config/waybar/
├── rofi/      → ~/.config/rofi/
├── kitty/     → ~/.config/kitty/
├── yazi/      → ~/.config/yazi/
├── fastfetch/ → ~/.config/fastfetch/
├── zsh/       → ~/.config/zsh/
├── nvim/      → ~/.config/nvim/
├── ghostty/   → ~/.config/ghostty/
├── nautilus/   → ~/.config/nautilus/
└── install.sh
```

## customizar

- **Wallpapers**: jogue imagens em `~/Pictures/Wallpapers/` e `SUPER+W` cicla
- **Keybinds**: `~/.config/hypr/hyprland.conf` (seção de `bind`)

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

<div align="center">
  <p>Feito com ❤️ por <a href="https://github.com/daneelgt">daneelgt</a></p>
  <p>Inspirado pela configurações incrivel da Bread on Penguins</p>
  <p>⭐ Este repositório se for útil para você!</p>
</div>
