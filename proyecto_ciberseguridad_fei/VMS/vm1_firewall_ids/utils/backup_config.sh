#!/bin/bash
# Backup de configuraciones de firewall y Suricata
# Autor: Proyecto SGSI FEI

BACKUP_DIR="/root/backup_vm1_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

cp /etc/iptables/rules.v4 "$BACKUP_DIR/iptables_rules.v4"
cp /etc/suricata/suricata.yaml "$BACKUP_DIR/suricata.yaml"
cp -r /etc/suricata/rules "$BACKUP_DIR/suricata_rules/"
cp /etc/network/interfaces "$BACKUP_DIR/network_interfaces.conf"
cp /etc/rsyslog.conf "$BACKUP_DIR/rsyslog.conf"

echo "Backup realizado en $BACKUP_DIR"
