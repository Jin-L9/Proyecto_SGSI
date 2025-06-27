#!/bin/bash
# Backup de configuración de WireGuard y red para VM2

BACKUP_DIR="./backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp ./configs/wg0.conf "$BACKUP_DIR" 2>/dev/null || true
cp ./configs/network_interfaces.conf "$BACKUP_DIR" 2>/dev/null || true
echo "[INFO] Backup guardado en $BACKUP_DIR"
