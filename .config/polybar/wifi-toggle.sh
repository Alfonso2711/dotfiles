#!/bin/bash

# Comprueba si existe la bandera temporal de clic
if [ -f /tmp/polybar_wifi_ip ]; then
  # Intenta sacar la IP de tu interfaz wlp2s0
  ip_addr=$(ip -4 addr show wlp2s0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

  # Respaldo de seguridad
  if [ -z "$ip_addr" ]; then
    ip_addr=$(hostname -I | awk '{print $1}')
  fi

  # Si no hay ninguna IP, avisa
  if [ -z "$ip_addr" ]; then
    echo "%{F#e67e80}󰩟 Sin IP%{F-}"
  else
    echo "󰩟 $ip_addr"
  fi
else
  # 1er Intento: Usar 'iw' leyendo directamente tu interfaz wlp2s0
  ssid=$(iw dev wlp2s0 link 2>/dev/null | grep 'SSID:' | sed 's/^\s*SSID: //')

  # 2do Intento (Respaldo): Si iw falla, usar NetworkManager (nmcli)
  if [ -z "$ssid" ]; then
    ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | egrep '^yes' | cut -d: -f2)
  fi

  # Imprimir el resultado final
  if [ -z "$ssid" ]; then
    echo "%{F#e67e80}󰤭 Desconectado%{F-}"
  else
    echo " $ssid"
  fi
fi
