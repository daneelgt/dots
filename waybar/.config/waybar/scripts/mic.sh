#!/bin/bash
# ── mic.sh ─────────────────────────────────────────────────
# Description: Shows microphone mute/unmute status with icon
# Usage: Called by Waybar `custom/microphone` module every 1s
# Dependencies: pactl (PulseAudio / PipeWire)
# ───────────────────────────────────────────────────────────


# Color logic (Puxando dinamicamente do Pywal)
if [ -f "$HOME/.cache/wal/colors" ]; then
    # Carrega as cores do Pywal em uma array
    mapfile -t wal_colors < "$HOME/.cache/wal/colors"
    COLOR_MUTED="${wal_colors[1]}" # Cor de alerta (tom vermelho/escuro) para mutado
    COLOR_MAIN="${wal_colors[6]}"  # Cor de destaque do seu wallpaper atual
fi

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'yes'; then
    # Muted -> mic-off icon (Usa a cor de mutado)
    echo "<span> |  </span>"
else
    # Active -> mic-on icon (Usa a cor principal do wallpaper)
    echo "<span> |  </span>"
fi

