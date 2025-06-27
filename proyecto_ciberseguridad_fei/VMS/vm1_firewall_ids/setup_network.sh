#!/bin/bash
# Script de configuración automática de red y servicios de seguridad para VM1 (Firewall + IDS/IPS)
# Proyecto SGSI FEI - Debian 12
# Fecha: 2025-06-27

# Validar ejecución como root
if [ "$EUID" -ne 0 ]; then
  echo "Este script debe ejecutarse como root. Usa: sudo $0"
  exit 1
fi

set -e

# Habilitar logging de errores
LOGFILE="/var/log/setup_network_error.log"
exec 2> >(tee -a "$LOGFILE" >&2)
trap 'log_message "ERROR" "Ocurrió un error en la línea $LINENO. Revisa $LOGFILE para detalles."' ERR

# --- Variables de red (ajusta según tu entorno VMware) ---
IFACE_PERIMETRAL="ens36"    # Internet/Perimetral
IFACE_DMZ="ens37"           # DMZ
IFACE_INTERNA="ens38"       # Red Interna
IFACE_MONITOREO="ens39"     # Red de Monitoreo

NET_PERIMETRAL="192.168.1.0/24"
NET_DMZ="192.168.10.0/24"
NET_INTERNA="192.168.20.0/24"
NET_MONITOREO="192.168.30.0/24"

IP_PERIMETRAL="192.168.1.1"
IP_DMZ="192.168.10.1"
IP_INTERNA="192.168.20.1"
IP_MONITOREO="192.168.30.1"

log_message() {
    echo "[$(date '+%F %T')] $1: $2"
}

install_packages() {
    log_message "INFO" "Instalando paquetes necesarios para firewall y monitoreo..."
    local packages=(iptables iptables-persistent netfilter-persistent ufw fail2ban rsyslog logrotate net-tools tcpdump nmap curl wget vim htop)
    apt update && apt upgrade -y
    for package in "${packages[@]}"; do
        log_message "INFO" "Instalando $package..."
        apt install -y "$package"
        if [[ $? -eq 0 ]]; then
            log_message "SUCCESS" "$package instalado correctamente"
        else
            log_message "ERROR" "Error al instalar $package"
            exit 1
        fi
    done
}

configure_network_interfaces() {
    log_message "INFO" "Configurando interfaces de red..."
    cp /etc/network/interfaces /etc/network/interfaces.backup.$(date +%Y%m%d_%H%M%S)
    cat > /etc/network/interfaces << EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

#The loopback network interface
auto lo
iface lo inet loopback

# Interfaz de acceso a Internet (NAT/Bridged)
allow-hotplug ens33
iface ens33 inet dhcp

auto $IFACE_PERIMETRAL
iface $IFACE_PERIMETRAL inet static
    address $IP_PERIMETRAL
    netmask 255.255.255.0
    gateway 192.168.1.254
    dns-nameservers 8.8.8.8 8.8.4.4

auto $IFACE_DMZ
iface $IFACE_DMZ inet static
    address $IP_DMZ
    netmask 255.255.255.0

auto $IFACE_INTERNA
iface $IFACE_INTERNA inet static
    address $IP_INTERNA
    netmask 255.255.255.0

auto $IFACE_MONITOREO
iface $IFACE_MONITOREO inet static
    address $IP_MONITOREO
    netmask 255.255.255.0
EOF
    # Guardar también en configs/network_interfaces.conf para referencia
    cat /etc/network/interfaces > "$(dirname "$0")/configs/network_interfaces.conf"
    systemctl restart networking
    log_message "SUCCESS" "Interfaces de red configuradas."
}

configure_nat() {
    log_message "INFO" "Configurando NAT y reenvío de paquetes..."
    # Habilitar reenvío de IPv4
    sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
    sysctl -p
    # Configurar NAT para salida a Internet desde DMZ, Interna y Monitoreo
    iptables -t nat -A POSTROUTING -s $NET_DMZ -o $IFACE_PERIMETRAL -j MASQUERADE
    iptables -t nat -A POSTROUTING -s $NET_INTERNA -o $IFACE_PERIMETRAL -j MASQUERADE
    iptables -t nat -A POSTROUTING -s $NET_MONITOREO -o $IFACE_PERIMETRAL -j MASQUERADE
    iptables-save > /etc/iptables/rules.v4
    log_message "SUCCESS" "NAT configurado."
}

configure_fail2ban() {
    log_message "INFO" "Configurando fail2ban..."
    cat > /etc/fail2ban/jail.local << 'EOF'
[DEFAULT]
bantime = 3600
banaction = iptables-multiport
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
EOF
    systemctl enable fail2ban
    systemctl start fail2ban
    log_message "SUCCESS" "fail2ban configurado y habilitado."
}

# --- Ejecución principal ---
install_packages
configure_network_interfaces
configure_nat
configure_fail2ban

log_message "INFO" "Configuración de red y seguridad completada."
