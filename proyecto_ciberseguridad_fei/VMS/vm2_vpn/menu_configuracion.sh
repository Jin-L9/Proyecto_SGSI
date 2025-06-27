#!/bin/bash
# Menú interactivo de configuración para VM2 (VPN - WireGuard)
# Proyecto SGSI FEI - Debian 12

while true; do
  clear
  echo "========= Menú de Configuración VM2 (WireGuard VPN) ========="
  echo "1) Instalar WireGuard"
  echo "2) Configurar red"
  echo "3) Configurar WireGuard (wg0.conf)"
  echo "4) Backup configuración"
  echo "5) Restaurar configuración"
  echo "6) Instalación automática (todo en uno)"
  echo "0) Salir"
  read -p "Selecciona una opción: " opt
  case $opt in
    1) sudo ./install_wireguard.sh; read -p "Presiona Enter para continuar...";;
    2) sudo ./setup_network.sh; read -p "Presiona Enter para continuar...";;
    3) sudo nano ./configs/wg0.conf; read -p "Presiona Enter para continuar...";;
    4) sudo ./utils/backup_config.sh; read -p "Presiona Enter para continuar...";;
    5) sudo ./utils/restore_config.sh; read -p "Presiona Enter para continuar...";;
    6) sudo ./instalacion_automatica.sh; read -p "Presiona Enter para continuar...";;
    0) exit 0;;
    *) echo "Opción inválida"; sleep 1;;
  esac
done
