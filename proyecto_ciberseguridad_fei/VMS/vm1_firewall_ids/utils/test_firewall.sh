#!/bin/bash
# Prueba rápida de reglas de firewall
# Autor: Proyecto SGSI FEI

set -e

# Probar conectividad básica
ping -c 2 8.8.8.8 && echo "Ping externo OK" || echo "Ping externo FALLÓ"

# Probar puerto SSH
nc -zv localhost 22 && echo "SSH local OK" || echo "SSH local FALLÓ"

# Probar reglas DROP
iptables -L INPUT -v | grep DROP

# Mostrar últimos logs de firewall
journalctl -u netfilter-persistent -n 20
