#!/bin/bash
# Script de configuración de red para VM2 (VPN - WireGuard)
# Proyecto SGSI FEI - Debian 12
# Fecha: 2025-06-27

if [ "$EUID" -ne 0 ]; then
  echo "Este script debe ejecutarse como root. Usa: sudo $0"
  exit 1
fi

set -e

LOGFILE="/var/log/setup_network_vpn_error.log"
exec 2> >(tee -a "$LOGFILE" >&2)
trap 'echo "[ERROR] Ocurrió un error en la línea $LINENO. Revisa $LOGFILE para detalles."' ERR

# Variables de red (ajusta según tu entorno)
IFACE_WAN="ens33"   # Interfaz hacia Internet
IFACE_LAN="ens34"   # Interfaz hacia red interna
#IP_WAN="192.168.1.2"
IP_LAN="10.10.10.1"

cp /etc/network/interfaces /etc/network/interfaces.backup.$(date +%Y%m%d_%H%M%S)
cat > /etc/network/interfaces << EOF
# interfaces(5) file for VM2 (VPN)
source /etc/network/interfaces.d/*
auto lo
iface lo inet loopback

allow-hotplug $IFACE_WAN
iface $IFACE_WAN inet dhcp

auto $IFACE_LAN
iface $IFACE_LAN inet static
    address $IP_LAN
    netmask 255.255.255.0
EOF

cat /etc/network/interfaces > "$(dirname "$0")/configs/network_interfaces.conf"
systemctl restart networking
echo "[SUCCESS] Interfaces de red configuradas."
