#!/bin/bash
# Script de instalación y configuración básica de Suricata en Debian 12
# Autor: Proyecto SGSI FEI
# Fecha: 2025-06-27

set -e

# Actualizar sistema
apt update && apt upgrade -y

# Instalar Suricata
apt install -y suricata

# Habilitar Suricata en modo IPS (NFQUEUE)
sed -i 's/^RUNMODE=.*/RUNMODE=autodetect/' /etc/default/suricata

# Copiar configuración personalizada si existe
if [ -f "$(dirname "$0")/configs/suricata.yaml" ]; then
    cp "$(dirname "$0")/configs/suricata.yaml" /etc/suricata/suricata.yaml
fi

# Habilitar y arrancar Suricata
systemctl enable suricata
systemctl restart suricata

echo "Suricata instalado y configurado. Edita configs/suricata.yaml para personalizar."
