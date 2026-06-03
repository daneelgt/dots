#!/bin/bash
# ── volume.sh ─────────────────────────────────────────────
# Description: Shows current audio volume with ASCII bar + tooltip
# Usage: Waybar `custom/volume` every 1s
# Dependencies: wpctl, awk, bc, seq, printf
# ───────────────────────────────────────────────────────────

# Get raw volume and convert to int
vol_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 }')
vol_int=$(echo "$vol_raw * 100 / 1" | bc 2> /dev/null)

# Check mute status
is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo true || echo false)

# Get default sink description (human-readable)
sink=$(wpctl status | awk '/Sinks:/,/Sources:/' | grep '\*' | cut -d'.' -f2- | sed 's/^\s*//; s/\[.*//')

# Icon logic
if [ "$is_muted" = true ]; then
  icon="   "
  vol_int=0
elif [ "$vol_int" -lt 50 ]; then
  icon="   "
else
  icon="   "
fi

# ASCII bar
filled=$((vol_int / 10))
empty=$((10 - filled))
bar=""
pad=""
[ $filled -gt 0 ] && bar=$(printf '█%.0s' $(seq 1 $filled))
[ $empty -gt 0 ] && pad=$(printf '░%.0s' $(seq 1 $empty))
ascii_bar="[$bar$pad]"

# Color logic
if [ -f "$HOME/.cache/wal/colors" ]; then
    # Carrega as cores do Pywal em uma array (color0 até color15)
    mapfile -t wal_colors < "$HOME/.cache/wal/colors"
    COLOR_MUTED="${wal_colors[1]}" # Cor 1 (Geralmente um tom avermelhado)
    COLOR_MAIN="${wal_colors[6]}"  # Cor 6 (Cor de destaque do wallpaper)
else
    # Cores de segurança caso o Pywal não tenha rodado
    COLOR_MUTED="#bf616a"
    COLOR_MAIN="#a68d74"
fi

if [ "$is_muted" = true ] || [ "$vol_int" -lt 10 ]; then
    fg="$COLOR_MUTED"
elif [ "$vol_int" -lt 50 ]; then
    fg="$COLOR_MAIN"
else
    fg="$COLOR_MAIN"
fi

# Final JSON output
echo "{\"text\":\"<span foreground='$fg'>$icon $ascii_bar $vol_int%</span>\",\"tooltip\":\"$tooltip\"}"

