#!/usr/bin/env bash

# 1. Matar cualquier barra de Polybar que esté corriendo
killall -q polybar

# 2. Esperar a que los procesos se cierren por completo
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Lanzar tu barra personalizada
polybar main -c ~/.config/polybar/config.ini &
