#!/bin/bash
# Instalación automática paso a paso para VM1 Firewall + IDS/IPS
# Ejecuta todos los pasos críticos y muestra el estado de cada uno
# Proyecto SGSI FEI

set -e

log_message() {
    echo "[$(date '+%F %T')] $1: $2"
}

check_root() {
    if [ "$EUID" -ne 0 ]; then
      echo "Este script debe ejecutarse como root. Usa: sudo $0"
      exit 1
    fi
}

main() {
    check_root
    log_message "INFO" "Iniciando instalación automática de VM1 (Firewall + IDS/IPS)"

    log_message "INFO" "1. Configuración de red y servicios básicos..."
    if ./setup_network.sh; then
        log_message "SUCCESS" "Red y servicios básicos configurados."
    else
        log_message "ERROR" "Fallo en la configuración de red. Abortando."
        exit 1
    fi

    log_message "INFO" "2. Instalando/Reinstalando iptables..."
    if ./install_iptables.sh; then
        log_message "SUCCESS" "iptables instalado y configurado."
    else
        log_message "ERROR" "Fallo en la instalación de iptables. Abortando."
        exit 1
    fi

    log_message "INFO" "3. Instalando/Reinstalando Suricata..."
    if ./install_suricata.sh; then
        log_message "SUCCESS" "Suricata instalado y configurado."
    else
        log_message "ERROR" "Fallo en la instalación de Suricata. Abortando."
        exit 1
    fi

    log_message "INFO" "4. Aplicando reglas de iptables personalizadas..."
    if iptables-restore < ./configs/iptables_rules.conf && iptables-save > /etc/iptables/rules.v4; then
        log_message "SUCCESS" "Reglas de iptables aplicadas."
    else
        log_message "ERROR" "Fallo al aplicar reglas de iptables."
    fi

    log_message "INFO" "5. Configuración y servicios completados."
    log_message "SUCCESS" "Instalación automática finalizada correctamente."
}

main
