# VM1: Firewall + IDS/IPS (iptables + Suricata)

## Descripción
Esta VM actúa como firewall principal y sistema de detección/prevención de intrusos (IDS/IPS) para el entorno VMware, usando iptables y Suricata.

## Flujo de ejecución recomendado

1. **Instalación automática (recomendada)**
   - Ejecuta todos los pasos críticos de instalación y configuración de red, iptables y Suricata.
   - Comando: `sudo ./menu_configuracion.sh` y selecciona la opción 1.
2. **Configuración automática de red y servicios**
   - Configura interfaces, NAT, fail2ban y guarda la configuración en `configs/network_interfaces.conf`.
   - Comando: Opción 2 del menú o `sudo ./setup_network.sh`.
3. **Instalación/Reinstalación de iptables y Suricata**
   - Instala o reinstala los servicios por separado si es necesario (opciones 3 y 4).
4. **Aplicar reglas personalizadas de iptables**
   - Aplica reglas avanzadas desde `configs/iptables_rules.conf` (opción 5).
5. **Gestión y monitoreo**
   - Reinicia Suricata, visualiza logs, realiza backups/restauraciones y pruebas desde el menú.

## Scripts principales
- `menu_configuracion.sh`: Menú interactivo para administración y flujo guiado.
- `instalacion_automatica.sh`: Instalación y configuración completa, paso a paso.
- `setup_network.sh`: Configuración automática de red, NAT y fail2ban.
- `install_iptables.sh`: Instalación y configuración de iptables.
- `install_suricata.sh`: Instalación y configuración de Suricata.
- `utils/`: Utilidades de backup, restore, test y monitoreo.

## Archivo `network_interfaces.conf`
Este archivo almacena la configuración real aplicada a las interfaces de red de la VM, generada automáticamente por `setup_network.sh`. Sirve como referencia y respaldo para auditoría o restauración manual.

## Requisitos
- Debian 12
- Acceso root
- Red correctamente configurada en VMware

## Ejecución rápida
```bash
sudo ./menu_configuracion.sh
```
Sigue el flujo recomendado para una instalación y configuración exitosa.
