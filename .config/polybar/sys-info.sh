#!/usr/bin/env bash

# Si la bandera existe, el menú está "abierto"
if [ -f /tmp/sys_expanded ]; then
    # Leer CPU y RAM al instante
    cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
    ram=$(free -h | awk '/^Mem:/ {print $3}' | sed 's/i//g')
    
    # Imprimir íconos, valores coloreados y flecha hacia la derecha para contraer
    echo "%{F#E06C75}  ${cpu}%%{F-}   %{F#98C379}  ${ram}%{F-}   "
else
    # Si está cerrado, solo mostrar la flecha hacia la izquierda
    echo ""
fi
