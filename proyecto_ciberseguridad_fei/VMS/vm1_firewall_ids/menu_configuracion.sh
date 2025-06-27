#!/bin/bash
# Menú interactivo de configuración para VM1 Firewall + IDS/IPS
# Autor: Proyecto SGSI FEI
# Fecha: 2025-06-27

while true; do
    clear
    echo "==============================="
    echo "  Menú de Configuración VM1   "
    echo "==============================="
    echo "1) Instalación automática (recomendada)"
    echo "===Instalacción manual de los componentes críticos:==="
    echo "2) Configuración automática de red y servicios (setup_network.sh)"
    echo "3) Instalar/Reinstalar iptables"
    echo "4) Instalar/Reinstalar Suricata"
    echo "5) Aplicar reglas de iptables personalizadas"
    echo "6) Reiniciar Suricata"
    echo "7) Ver logs de Suricata"
    echo "8) Backup de configuración"
    echo "9) Restaurar configuración"
    echo "10) Probar reglas de firewall"
    echo "11) Salir"
    read -p "Seleccione una opción: " opt
    case $opt in
        1) sudo ./instalacion_automatica.sh; read -p "Presione Enter para continuar...";;
        2) sudo ./setup_network.sh; read -p "Presione Enter para continuar...";;
        3) sudo ./install_iptables.sh; read -p "Presione Enter para continuar...";;
        4) sudo ./install_suricata.sh; read -p "Presione Enter para continuar...";;
        5) sudo iptables-restore < ./configs/iptables_rules.conf && sudo iptables-save > /etc/iptables/rules.v4; echo "Reglas aplicadas."; read -p "Presione Enter...";;
        6) sudo systemctl restart suricata; echo "Suricata reiniciado."; read -p "Presione Enter...";;
        7) sudo tail -f /var/log/suricata/fast.log;;
        8) sudo ./utils/backup_config.sh; read -p "Presione Enter...";;
        9) sudo ./utils/restore_config.sh; read -p "Presione Enter...";;
        10) sudo ./utils/test_firewall.sh; read -p "Presione Enter...";;
        11) exit 0;;
        *) echo "Opción inválida."; sleep 1;;
    esac
done
