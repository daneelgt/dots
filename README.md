# dotfiles

<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/7b063dea-c5a9-438c-9cd2-989f0d1c3d72" />

## stack

| componente | uso |
|---|---|
| **Hyprland** | window manager (Wayland, NVIDIA) |
| **Waybar** | status bar floating no topo |
| **Rofi (rofi-wayland)** | launcher (drun, run, window) |
| **Kitty** | terminal emulator |
| **Yazi** | file manager TUI com previews |
| **swww** | wallpaper engine animado |
| **Fish** | shell |

## instalação

```sh
git clone https://github.com/daneelgt/dotfiles.git ~/dotfiles
cd ~/dotfiles
```


## keybinds principais

| atalho | ação |
|---|---|
| `SUPER + Enter` | terminal (kitty) |
| `SUPER + R` | launcher (rofi) |
| `SUPER + E` | file manager (yazi) |
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
├── fish/      → ~/.config/fish/
└── git/       → ~/.gitconfig
```

## customizar

- **Wallpapers**: jogue imagens em `~/Pictures/Wallpapers/` e `SUPER+W` cicla
- **Keybinds**: `~/.config/hypr/hyprland.conf` (seção de `bind`)
