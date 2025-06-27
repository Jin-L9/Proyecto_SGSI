# VM1: Firewall + IDS/IPS (iptables + Suricata)

## Descripción
Esta VM actúa como firewall principal y sistema de detección/prevención de intrusos (IDS/IPS) para el entorno VMware, usando iptables y Suricata.

## Estructura
- `install_iptables.sh`: Instala y configura iptables.
- `install_suricata.sh`: Instala y configura Suricata.
- `menu_configuracion.sh`: Menú interactivo para administración.
- `configs/`: Configuraciones de firewall, Suricata y red.
- `utils/`: Utilidades de backup, restore, test y monitoreo.

## Uso rápido
```bash
sudo ./menu_configuracion.sh
```

## Requisitos
- Debian 12
- Acceso root
- Red correctamente configurada
