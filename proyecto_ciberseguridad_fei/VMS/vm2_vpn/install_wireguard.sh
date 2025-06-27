#!/bin/bash
# Script de instalación y configuración básica de WireGuard para VM2 (VPN)
# Proyecto SGSI FEI - Debian 12
# Fecha: 2025-06-27

if [ "$EUID" -ne 0 ]; then
  echo "Este script debe ejecutarse como root. Usa: sudo $0"
  exit 1
fi

set -e

LOGFILE="/var/log/install_wireguard_error.log"
exec 2> >(tee -a "$LOGFILE" >&2)
trap 'echo "[ERROR] Ocurrió un error en la línea $LINENO. Revisa $LOGFILE para detalles."' ERR

echo "[INFO] Instalando WireGuard y utilidades necesarias..."
apt update && apt install -y wireguard qrencode net-tools

echo "[INFO] Generando claves para el servidor..."
WG_DIR="/etc/wireguard"
mkdir -p $WG_DIR
umask 077
wg genkey | tee $WG_DIR/server_private.key | wg pubkey > $WG_DIR/server_public.key

echo "[INFO] WireGuard instalado y claves generadas. Configura wg0.conf y ejecuta: systemctl start wg-quick@wg0"
