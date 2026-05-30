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

# 2. Instalar pacotes principais via Pacman (Interface, Áudio, Ferramentas e Jogos)
echo "📦 Instalando pacotes oficiais via pacman..."
sudo pacman -S --noconfirm \
    waybar \
    bc \
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
    cachyos-gaming-meta

# 3. Instalar pacotes do AUR via Yay (VS Code, Launchers e Toolbox)
echo "📦 Instalando pacotes do AUR via yay..."
yay -S --noconfirm \
    visual-studio-code-bin \
    minecraft-launcher \
    prismlauncher \
    jetbrains-toolbox

# 4. Aplicar o tema de cores com o Pywal
echo "🎨 Aplicando paleta de cores com o Pywal..."
if [ -f "/home/ninhux/Pictures/Wallpapers/a.png" ]; then
    wal -i /home/ninhux/Pictures/Wallpapers/a.png
else
    echo "⚠️ Wallpaper 'a.png' não encontrado no caminho especificado. Pulando Pywal..."
fi

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
if pacman -Qdt > /dev/null; then
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
