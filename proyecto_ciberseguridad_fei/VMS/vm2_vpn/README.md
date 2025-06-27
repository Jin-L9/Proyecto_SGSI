# VM2 - WireGuard VPN (Proyecto SGSI FEI)

Este directorio contiene los scripts y configuraciones para automatizar la instalación y gestión de la VM2 como servidor VPN usando **WireGuard** en Debian 12.

## Estructura
- `install_wireguard.sh`: Instala WireGuard y genera claves.
- `setup_network.sh`: Configura las interfaces de red de la VM2.
- `menu_configuracion.sh`: Menú interactivo para ejecutar tareas comunes.
- `instalacion_automatica.sh`: Ejecuta todos los pasos críticos de forma automática.
- `set_permissions.sh`: Ajusta permisos de scripts y archivos sensibles.
- `utils/backup_config.sh` y `utils/restore_config.sh`: Backup y restauración de la configuración.
- `configs/wg0.conf`: Configuración base de WireGuard.

## Flujo recomendado
1. Ejecuta `set_permissions.sh` tras copiar los archivos.
2. Usa `menu_configuracion.sh` para instalar y configurar todo paso a paso, o ejecuta `instalacion_automatica.sh` para un despliegue rápido.
3. Edita `configs/wg0.conf` para personalizar claves y peers.
4. Activa el servicio con: `systemctl start wg-quick@wg0`

## Notas
- Todos los logs de error se almacenan en `/var/log/` para facilitar la depuración.
- Puedes modificar las interfaces y direcciones IP en los scripts según tu entorno VMware.
- WireGuard es más simple y eficiente que OpenVPN, ideal para entornos modernos y automatizados.
