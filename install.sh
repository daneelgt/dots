#!/bin/bash

set -euo pipefail

echo "🚀 Iniciando a instalação dos pacotes e configurações..."

# ==========================================
# 1. Atualizar e Instalar Pacotes
# ==========================================
echo "🔄 Atualizando repositórios..."
sudo pacman -Syu --noconfirm

# ===============================
# Dependências básicas
# ===============================
echo "📦 Instalando dependências básicas..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    git


# 2. Instalar pacotes principais via Pacman (Interface, Áudio, Ferramentas e Jogos)
echo "📦 Instalando pacotes oficiais via pacman..."

sudo pacman -S --needed --noconfirm \
  waybar \
  pacman-contrib \
  amberol \
  imv \
  bc \
  jq \
  nwg-look \
  gnome-themes-extra \
  pavucontrol \
  wget \
  curl \
  pipewire \
  pipewire-pulse \
  pipewire-alsa \
  wireplumber \
  swww \
  spotify-launcher \
  steam \
  solaar \
  discord \
  rnote \
  btop \
  zip \
  unzip \
  python-pywal \
  grim \
  slurp \
  wl-clipboard \
  ghostty \
  inotify-tools \
  ttf-jetbrains-mono-nerd \
  nautilus \
  yazi \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  zoxide \
  thefuck \
  rofi \
  linux-headers

# ===============================
# Instalar yay
# ===============================

if ! command -v yay >/dev/null 2>&1; then
    echo "📦 Instalando yay..."

    TMPDIR=$(mktemp -d)

    git clone https://aur.archlinux.org/yay.git "$TMPDIR/yay"

    cd "$TMPDIR/yay"
    makepkg -si --noconfirm

    cd ~
    rm -rf "$TMPDIR"
fi


# 3. Instalar pacotes do AUR via Yay (VS Code, Launchers e Toolbox)
echo "📦 Instalando pacotes do AUR via yay..."

yay -S --needed --noconfirm \
  visual-studio-code-bin \
  minecraft-launcher \
  prismlauncher \
  jetbrains-toolbox \
  bluetui \
  python-setuptools \
  zscroll \
  nwg-look \
  nvidia-580xx-dkms \
  nvidia-580xx-utils \
  lib32-nvidia-580xx-utils \
  nvidia-580xx-settings \
  gnome-themes-extra

# ===============================
# Atualizar initramfs
# ===============================
echo "🔧 Atualizando initramfs..."
sudo mkinitcpio -P

# 4. Aplicar o tema de cores com o Pywal
echo "🎨 Aplicando paleta de cores com o Pywal..."
if [ -d "$HOME/Pictures/Wallpapers" ]; then
    WALL=$(find "$HOME/Pictures/Wallpapers" -type f | shuf -n 1)

    if [ -n "$WALL" ]; then
        echo "🎨 Aplicando Pywal..."
        wal -i "$WALL"
    fi
fi

# 5. Dar permissão de execução aos scripts do Waybar e Hyprland
echo "🔧 Ajustando permissões dos scripts executáveis..."
chmod +x ~/.config/hypr/scripts/wallpaper.sh 2>/dev/null
find ~/.config/hypr/scripts -type f -exec chmod +x {} \; 2>/dev/null || true
find ~/.config/waybar/scripts -type f -exec chmod +x {} \; 2>/dev/null || true

# ===============================
# Powerlevel10k
# ===============================

if [ ! -d "$HOME/powerlevel10k" ]; then
    echo "📦 Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/powerlevel10k"
fi

[[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]] && \
    source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

command -v thefuck >/dev/null && eval "$(thefuck --alias)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# ==========================================
# 4. Limpeza Geral de Sujeira do Sistema
# ==========================================
echo "🧹 Iniciando a faxina do sistema para liberar espaço..."

ORPHANS=$(pacman -Qdtq 2>/dev/null || true)

if [ -n "$ORPHANS" ]; then
    sudo pacman -Rns $ORPHANS --noconfirm
fi

sudo paccache -r

yay -Yc --noconfirm || true
yay -Scc --noconfirm || true

rm -rf ~/.local/share/Trash/* 2>/dev/null || true

# ===============================
# Verificação NVIDIA
# ===============================
echo "🎮 Verificando driver NVIDIA..."

if command -v nvidia-smi >/dev/null; then
    nvidia-smi
fi

echo ""
echo "✅ Tudo pronto! Sistema configurado com sucesso."
