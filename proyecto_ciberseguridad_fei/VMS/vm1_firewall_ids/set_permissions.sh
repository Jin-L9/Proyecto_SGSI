#!/bin/bash
# Script para otorgar permisos de ejecución a los scripts principales de VM1
# Proyecto SGSI FEI

SCRIPTS=(
  "install_iptables.sh"
  "install_suricata.sh"
  "menu_configuracion.sh"
  "setup_network.sh"
  "utils/backup_config.sh"
  "utils/restore_config.sh"
  "utils/test_firewall.sh"
  "utils/monitor_logs.sh"
  "instalacion_automatica.sh"
)

for script in "${SCRIPTS[@]}"; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Permiso de ejecución otorgado a $script"
  else
    echo "Archivo $script no encontrado."
  fi

done
