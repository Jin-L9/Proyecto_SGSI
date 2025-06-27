#!/bin/bash
# Menú interactivo de configuración para VM1 Firewall + IDS/IPS
# Autor: Proyecto SGSI FEI
# Fecha: 2025-06-27

while true; do
    clear
    echo "==============================="
    echo "  Menú de Configuración VM1   "
    echo "==============================="
    echo "1) Instalar/Reinstalar iptables"
    echo "2) Instalar/Reinstalar Suricata"
    echo "3) Aplicar reglas de iptables personalizadas"
    echo "4) Reiniciar Suricata"
    echo "5) Ver logs de Suricata"
    echo "6) Backup de configuración"
    echo "7) Restaurar configuración"
    echo "8) Probar reglas de firewall"
    echo "9) Configuración automática de red y seguridad (setup_network.sh)"
    echo "10) Salir"
    read -p "Seleccione una opción: " opt
    case $opt in
        1) sudo ./install_iptables.sh; read -p "Presione Enter para continuar...";;
        2) sudo ./install_suricata.sh; read -p "Presione Enter para continuar...";;
        3) sudo iptables-restore < ./configs/iptables_rules.conf && sudo iptables-save > /etc/iptables/rules.v4; echo "Reglas aplicadas."; read -p "Presione Enter...";;
        4) sudo systemctl restart suricata; echo "Suricata reiniciado."; read -p "Presione Enter...";;
        5) sudo tail -f /var/log/suricata/fast.log;;
        6) sudo ./utils/backup_config.sh; read -p "Presione Enter...";;
        7) sudo ./utils/restore_config.sh; read -p "Presione Enter...";;
        8) sudo ./utils/test_firewall.sh; read -p "Presione Enter...";;
        9) sudo ./setup_network.sh; read -p "Presione Enter para continuar...";;
        10) exit 0;;
        *) echo "Opción inválida."; sleep 1;;
    esac
done
