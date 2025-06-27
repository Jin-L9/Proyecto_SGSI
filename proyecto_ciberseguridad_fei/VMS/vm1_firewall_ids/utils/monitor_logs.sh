#!/bin/bash
# Monitoreo en tiempo real de logs de firewall y Suricata
# Autor: Proyecto SGSI FEI

echo "Logs de iptables (kernel):"
tail -f /var/log/kern.log &

sleep 1
echo "Logs de Suricata:"
tail -f /var/log/suricata/fast.log
