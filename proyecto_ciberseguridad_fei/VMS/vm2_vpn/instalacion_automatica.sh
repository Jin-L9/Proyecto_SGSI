#!/bin/bash
# Instalación automática de VM2 (WireGuard VPN)
# Ejecuta todos los pasos críticos en orden recomendado

set -e

./install_wireguard.sh
./setup_network.sh

SERVER_PRIVATE_KEY=$(cat /etc/wireguard/server_private.key)
SERVER_PUBLIC_KEY=$(cat /etc/wireguard/server_public.key)

if [ -f ./configs/wg0.conf ]; then
  echo "[INFO] Archivo wg0.conf ya existe. Puedes editarlo si lo deseas."
else
  echo "[INFO] Generando plantilla básica de wg0.conf..."
  cat > ./configs/wg0.conf << EOF
[Interface]
Address = 10.10.10.1/24
ListenPort = 51820
PrivateKey = $SERVER_PRIVATE_KEY # Clave privada del servidor

# [Peer]
# PublicKey = $SERVER_PUBLIC_KEY # Clave pública del cliente
# AllowedIPs = 10.10.10.2/32
EOF
fi

echo "[INFO] Para activar WireGuard: systemctl start wg-quick@wg0"
echo "[SUCCESS] Instalación automática completada."
