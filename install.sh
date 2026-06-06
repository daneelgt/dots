#!/bin/bash

echo "🚀 Iniciando a instalação dos pacotes e configurações..."

# ==========================================
# 1. Atualizar e Instalar Pacotes
# ==========================================
echo "🔄 Atualizando repositórios..."
sudo pacman -Sy

# 1. Atualizar a base de dados dos repositórios
echo "🔄 Atualizando repositórios..."
sudo pacman -Sy

sudo pacman -S --needed --noconfirm base-devel git

# 2. Instalar pacotes principais via Pacman (Interface, Áudio, Ferramentas e Jogos)
echo "📦 Instalando pacotes oficiais via pacman..."
sudo pacman -S --noconfirm \
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
  nvidia-dkms \
  nvidia-utils \
  lib32-nvidia-utils \
  nvidia-settings \
  linux-headers \
  linux-lts-headers \
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
  zip unzip curl \
  python-pywal \
  grim slurp wl-clipboard \
  ghostty \
  inotify-tools \
  ttf-jetbrains-mono-nerd \
  nautilus

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# 3. Instalar pacotes do AUR via Yay (VS Code, Launchers e Toolbox)
echo "📦 Instalando pacotes do AUR via yay..."
yay -S --noconfirm \
  visual-studio-code-bin \
  minecraft-launcher \
  prismlauncher \
  jetbrains-toolbox \
  bluetui \
  python-setuptools \
  zscroll \
  nwg-look \
  gnome-themes-extra

# 4. Aplicar o tema de cores com o Pywal
echo "🎨 Aplicando paleta de cores com o Pywal..."
wal -i /home/ninhoo/Pictures/Wallpapers/

# 5. Dar permissão de execução aos scripts do Waybar e Hyprland
echo "🔧 Ajustando permissões dos scripts executáveis..."
chmod +x ~/.config/hypr/scripts/wallpaper.sh 2>/dev/null
chmod +x ~/.config/hypr/scripts/wallpaper-auto.sh 2>/dev/null
chmod +x ~/.config/waybar/scripts/* 2>/dev/null
chmod +x ~/.config/hypr/scripts/* 2>/dev/null

# ==========================================
# 4. Limpeza Geral de Sujeira do Sistema
# ==========================================
echo "🧹 Iniciando a faxina do sistema para liberar espaço..."

# 4.1 Remover pacotes órfãos do Pacman
if pacman -Qdt >/dev/null; then
  echo "🗑️  Removendo pacotes órfãos do Pacman..."
  sudo pacman -Rns $(pacman -Qdtq) --noconfirm
else
  echo "✅ Nenhum pacote órfão encontrado no Pacman."
fi

# 4.2 Remover pacotes órfãos do AUR
echo "🗑️  Limpando dependências desnecessárias do AUR..."
yay -Yc --noconfirm 2>/dev/null

# 4.3 Limpar cache de pacotes (Corrigido: sem o --noconfirm)
echo "📦 Limpando cache antigo de pacotes do Pacman..."
sudo paccache -r

# 4.4 Limpar cache do Yay/AUR
echo "📦 Limpando arquivos temporários de compilação do Yay..."
yay -Scc --noconfirm

# 4.5 Esvaziar a Lixeira
echo "🗑️  Esvaziando a lixeira (~/.local/share/Trash)..."
rm -rf ~/.local/share/Trash/* 2>/dev/null

echo "✅ Tudo pronto! Sistema configurado com sucesso."
