#!/bin/bash
# Restauración de configuración de WireGuard y red para VM2

read -p "Introduce el nombre del directorio de backup a restaurar: " DIR
if [ ! -d "$DIR" ]; then
  echo "[ERROR] No existe el directorio $DIR"
  exit 1
fi
cp "$DIR/wg0.conf" ./configs/ 2>/dev/null || true
cp "$DIR/network_interfaces.conf" ./configs/ 2>/dev/null || true
echo "[INFO] Configuración restaurada desde $DIR"
