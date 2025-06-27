#!/bin/bash
# Script para revocar un cliente de WireGuard
# Uso: sudo ./revoke_client.sh <CLIENT_PUBLIC_KEY>

WG_CONF="/etc/wireguard/wg0.conf"
WG_INTERFACE="wg0"

if [ "$EUID" -ne 0 ]; then
  echo "Este script debe ejecutarse como root."
  exit 1
fi

if [ -z "$1" ]; then
  echo "Uso: $0 <CLIENT_PUBLIC_KEY>"
  exit 1
fi

CLIENT_KEY="$1"

# Remover peer en caliente
echo "[INFO] Removiendo peer en caliente..."
wg set $WG_INTERFACE peer $CLIENT_KEY remove 2>/dev/null || true

# Remover del archivo de configuración
echo "[INFO] Eliminando sección del cliente en $WG_CONF..."
sed -i "/PublicKey = $CLIENT_KEY/,+2d" "$WG_CONF"

echo "[SUCCESS] Cliente revocado de WireGuard."
