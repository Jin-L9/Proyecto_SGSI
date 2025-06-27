#!/bin/bash
# Restaurar configuraciones de firewall y Suricata
# Autor: Proyecto SGSI FEI

read -p "Ruta del backup a restaurar: " BACKUP_DIR
if [ ! -d "$BACKUP_DIR" ]; then
  echo "Directorio no encontrado."
  exit 1
fi

cp "$BACKUP_DIR/iptables_rules.v4" /etc/iptables/rules.v4
cp "$BACKUP_DIR/suricata.yaml" /etc/suricata/suricata.yaml
cp -r "$BACKUP_DIR/suricata_rules/" /etc/suricata/rules/
cp "$BACKUP_DIR/network_interfaces.conf" /etc/network/interfaces
cp "$BACKUP_DIR/rsyslog.conf" /etc/rsyslog.conf

systemctl restart netfilter-persistent
systemctl restart suricata
systemctl restart networking
systemctl restart rsyslog

echo "Restauración completada."
