#!/bin/bash
# Script de instalación y configuración básica de iptables en Debian 12
# Autor: Proyecto SGSI FEI
# Fecha: 2025-06-27

set -e

# Actualizar sistema
apt update && apt upgrade -y

# Instalar iptables y persistencia
apt install -y iptables iptables-persistent

# Limpiar reglas existentes
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Aplicar reglas básicas (ejemplo, se sobreescriben luego por iptables_rules.conf)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permitir loopback
iptables -A INPUT -i lo -j ACCEPT

# Permitir SSH desde red interna (ajustar IP según red)
iptables -A INPUT -p tcp --dport 22 -s 192.168.1.0/24 -j ACCEPT

# Guardar reglas
iptables-save > /etc/iptables/rules.v4

# Habilitar persistencia
systemctl enable netfilter-persistent
systemctl restart netfilter-persistent

echo "iptables instalado y configurado. Edita configs/iptables_rules.conf para reglas avanzadas."
