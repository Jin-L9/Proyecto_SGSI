#!/bin/bash
# Ajusta permisos de scripts y archivos sensibles para VM2 (WireGuard VPN)

chmod 700 install_wireguard.sh setup_network.sh instalacion_automatica.sh menu_configuracion.sh
chmod 700 utils/*.sh
chmod 600 configs/wg0.conf 2>/dev/null || true
chmod 700 .
echo "[INFO] Permisos ajustados."
