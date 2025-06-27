# Estructura del Proyecto de Ciberseguridad FEI
## Sistema Integral basado en NIST CSF 2.0 - Implementación VMware Workstation

### 📁 Estructura de Directorios del Proyecto

```
proyecto_ciberseguridad_fei/
├── 📋 documentacion/
│   ├── 01_analisis_riesgos/
│   │   ├── matriz_riesgos.xlsx
│   │   ├── identificacion_activos.pdf
│   │   ├── amenazas_vulnerabilidades.md
│   │   └── evaluacion_impacto.pdf
│   ├── 02_politicas_seguridad/
│   │   ├── politica_acceso.pdf
│   │   ├── politica_informacion.pdf
│   │   ├── politica_uso_aceptable.pdf
│   │   ├── politica_seguridad_perimetral.pdf
│   │   └── politica_respaldo.pdf
│   ├── 03_planes_respuesta/
│   │   ├── plan_respuesta_incidentes.pdf
│   │   ├── plan_recuperacion_desastres.pdf
│   │   ├── procedimientos_escalamiento.md
│   │   └── matriz_comunicacion.xlsx
│   ├── 04_arquitectura_seguridad/
│   │   ├── diagrama_red_completo.drawio
│   │   ├── arquitectura_sgsi.pdf
│   │   ├── topologia_vmware.png
│   │   └── segmentacion_vlans.md
│   ├── 05_evaluacion_cumplimiento/
│   │   ├── mapeo_nist_csf.xlsx
│   │   ├── metricas_seguridad.md
│   │   └── auditoria_controles.pdf
│   └── 06_manuales_usuario/
│       ├── manual_administrador.pdf
│       ├── manual_usuario_final.pdf
│       └── guia_respuesta_incidentes.pdf
├── 🖥️ infraestructura/
│   ├── vmware_templates/
│   │   ├── debian12_base.ovf
│   │   ├── configuracion_red_base.txt
│   │   └── plantilla_vm.vmx
│   ├── networking/
│   │   ├── vlan_config.txt
│   │   ├── segmentacion_red.md
│   │   ├── tabla_ips.xlsx
│   │   └── esquema_routing.md
│   └── recursos_hardware/
│       ├── especificaciones_vms.md
│       └── requisitos_minimos.txt
├── 🔧 VMS/
│   ├── vm1_firewall_ids/
│   │   ├── install_iptables.sh
│   │   ├── install_suricata.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── iptables_rules.conf
│   │   │   ├── suricata.yaml
│   │   │   ├── network_interfaces.conf
│   │   │   └── rsyslog_firewall.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── test_firewall.sh
│   │   │   └── monitor_logs.sh
│   │   └── README.md
│   ├── vm2_vpn/
│   │   ├── install_wireguard.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── wireguard_server.conf
│   │   │   ├── client_template.conf
│   │   │   ├── pki_setup.conf
│   │   │   └── firewall_vpn.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── generate_client.sh
│   │   │   └── revoke_client.sh
│   │   └── README.md
│   ├── vm3_proxy/
│   │   ├── install_squid.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── squid.conf
│   │   │   ├── access_control.acl
│   │   │   ├── cache_config.conf
│   │   │   └── blocked_sites.txt
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── update_blacklist.sh
│   │   │   └── cache_stats.sh
│   │   └── README.md
│   ├── vm4_webserver/
│   │   ├── install_apache_php.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── apache2.conf
│   │   │   ├── ssl_config.conf
│   │   │   ├── security_headers.conf
│   │   │   ├── php.ini
│   │   │   └── vhost_template.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── ssl_renewal.sh
│   │   │   └── security_scan.sh
│   │   ├── webroot/
│   │   │   ├── index.php
│   │   │   ├── info.php
│   │   │   └── security_test.php
│   │   └── README.md
│   ├── vm5_ids_honeypot/
│   │   ├── install_suricata_dmz.sh
│   │   ├── install_cowrie.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── suricata_dmz.yaml
│   │   │   ├── cowrie.cfg
│   │   │   ├── dionaea.cfg
│   │   │   └── honeypot_rules.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── analyze_attacks.sh
│   │   │   └── honeypot_stats.sh
│   │   └── README.md
│   ├── vm6_auth/
│   │   ├── install_freeipa.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── freeipa_config.conf
│   │   │   ├── ldap_schema.ldif
│   │   │   ├── kerberos.conf
│   │   │   └── sudo_rules.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── user_management.sh
│   │   │   └── policy_check.sh
│   │   └── README.md
│   ├── vm7_siem/
│   │   ├── install_wazuh.sh
│   │   ├── install_elk_stack.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── wazuh_manager.conf
│   │   │   ├── elasticsearch.yml
│   │   │   ├── kibana.yml
│   │   │   ├── logstash.conf
│   │   │   └── custom_rules.xml
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── index_management.sh
│   │   │   └── alert_testing.sh
│   │   ├── dashboards/
│   │   │   ├── security_overview.json
│   │   │   ├── network_monitoring.json
│   │   │   └── incident_response.json
│   │   └── README.md
│   ├── vm8_monitoring/
│   │   ├── install_zabbix.sh
│   │   ├── menu_configuracion.sh
│   │   ├── configs/
│   │   │   ├── zabbix_server.conf
│   │   │   ├── zabbix_agent.conf
│   │   │   ├── mysql_config.conf
│   │   │   └── alert_scripts.conf
│   │   ├── utils/
│   │   │   ├── backup_config.sh
│   │   │   ├── restore_config.sh
│   │   │   ├── template_import.sh
│   │   │   └── performance_check.sh
│   │   ├── templates/
│   │   │   ├── linux_server_template.xml
│   │   │   ├── network_device_template.xml
│   │   │   └── security_monitoring_template.xml
│   │   └── README.md
│   └── vm9_forensics/
│       ├── install_forensics_tools.sh
│       ├── install_python_tools.sh
│       ├── menu_configuracion.sh
│       ├── configs/
│       │   ├── autopsy_config.conf
│       │   ├── volatility_config.conf
│       │   ├── sleuthkit_config.conf
│       │   └── analysis_profiles.conf
│       ├── utils/
│       │   ├── backup_config.sh
│       │   ├── restore_config.sh
│       │   ├── evidence_collector.sh
│       │   └── report_generator.sh
│       ├── scripts/
│       │   ├── incident_response.py
│       │   ├── log_analyzer.py
│       │   ├── network_forensics.py
│       │   └── malware_analyzer.py
│       └── README.md
├── 🔧 scripts_automatizacion/
│   ├── 01_instalacion_base/
│   │   ├── base_system.sh
│   │   ├── security_hardening.sh
│   │   ├── logging_setup.sh
│   │   └── network_base_config.sh
│   ├── 02_instalacion_masiva/
│   │   ├── install_all_vms.sh
│   │   ├── configure_all_vms.sh
│   │   └── validate_installation.sh
│   └── 03_post_instalacion/
│       ├── test_connectivity.sh
│       ├── security_validation.sh
│       ├── backup_all_configs.sh
│       └── generate_reports.sh
├── ⚙️ configuraciones_globales/
│   ├── network/
│   │   ├── global_routing.conf
│   │   ├── dns_config.conf
│   │   └── ntp_config.conf
│   ├── security/
│   │   ├── ssl_certificates/
│   │   ├── ssh_keys/
│   │   └── security_policies.conf
│   └── monitoring/
│       ├── snmp_config.conf
│       ├── syslog_central.conf
│       └── alert_definitions.conf
├── 📊 logs_y_evidencias/
│   ├── instalacion/
│   │   ├── vm1_install.log
│   │   ├── vm2_install.log
│   │   ├── vm3_install.log
│   │   ├── vm4_install.log
│   │   ├── vm5_install.log
│   │   ├── vm6_install.log
│   │   ├── vm7_install.log
│   │   ├── vm8_install.log
│   │   └── vm9_install.log
│   ├── configuracion/
│   │   ├── firewall_config_evidence.log
│   │   ├── ids_config_evidence.log
│   │   ├── proxy_config_evidence.log
│   │   ├── web_config_evidence.log
│   │   ├── vpn_config_evidence.log
│   │   ├── auth_config_evidence.log
│   │   ├── siem_config_evidence.log
│   │   ├── monitoring_config_evidence.log
│   │   └── forensics_config_evidence.log
│   ├── pruebas_funcionales/
│   │   ├── connectivity_tests.log
│   │   ├── security_tests.log
│   │   ├── penetration_tests.log
│   │   └── compliance_tests.log
│   ├── capturas_pantalla/
│   │   ├── vm1_firewall_dashboard/
│   │   ├── vm2_vpn_status/
│   │   ├── vm3_proxy_logs/
│   │   ├── vm4_web_security/
│   │   ├── vm5_honeypot_attacks/
│   │   ├── vm6_auth_users/
│   │   ├── vm7_siem_alerts/
│   │   ├── vm8_monitoring_graphs/
│   │   └── vm9_forensics_analysis/
│   └── reportes/
│       ├── security_assessment.pdf
│       ├── compliance_report.pdf
│       └── incident_reports/
├── 🧪 pruebas_y_validacion/
│   ├── scripts_testing/
│   │   ├── test_firewall_rules.sh
│   │   ├── test_ids_detection.sh
│   │   ├── test_vpn_connectivity.sh
│   │   ├── test_proxy_filtering.sh
│   │   ├── test_web_security.sh
│   │   ├── test_honeypot_response.sh
│   │   ├── test_auth_policies.sh
│   │   ├── test_siem_correlation.sh
│   │   ├── test_monitoring_alerts.sh
│   │   └── test_forensics_tools.sh
│   ├── simulacion_incidentes/
│   │   ├── ddos_simulation.sh
│   │   ├── malware_simulation.sh
│   │   ├── intrusion_simulation.sh
│   │   ├── phishing_simulation.sh
│   │   └── insider_threat_simulation.sh
│   ├── validacion_controles/
│   │   ├── nist_compliance_check.sh
│   │   ├── security_audit.sh
│   │   ├── vulnerability_scan.sh
│   │   └── configuration_review.sh
│   └── reportes_testing/
│       ├── test_results.html
│       ├── vulnerability_report.pdf
│       └── compliance_matrix.xlsx
├── 📝 bitacora_proyecto/
│   ├── bitacora_equipo.md
│   ├── cronograma_actividades.xlsx
│   ├── reuniones_seguimiento.md
│   ├── cambios_configuracion.log
│   ├── incidentes_desarrollo.md
│   └── lecciones_aprendidas.md
└── 📋 entregables_finales/
    ├── documento_sgsi_completo.pdf
    ├── presentacion_proyecto.pptx
    ├── tarball_evidencias.tar.gz
    ├── manual_administrador_completo.pdf
    ├── manual_usuario_final.pdf
    └── guia_mantenimiento.pdf
```

### 🎯 Distribución de VMs por Zona de Red

#### 🔒 Zona Perimetral (expuesta a Internet)

| VM      | Rol / Categoría principal | vCPU | RAM  | Disco GB | NICs                                     | Funciones clave                                                                 | Software principal                             |
| ------- | ------------------------- | ---- | ---- | -------- | ---------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------- |
| **VM1** | **Firewall + IDS/IPS**    | 2    | 4 GB | 20       | 4 (Perimetral, DMZ, Interna, Monitoreo) | Filtrado con iptables, NAT, ruteo entre zonas, inspección de paquetes, detección de intrusos | **iptables** + **Suricata** (modo IPS) |
| **VM2** | **VPN Server**            | 1    | 2 GB | 15       | 2 (Perimetral, Interna)                 | Acceso remoto seguro (road-warrior y site-to-site)                              | **WireGuard**                                  |
| **VM3** | **Proxy / Caché**         | 1    | 2 GB | 20       | 2 (Perimetral, Interna)                 | Caché, filtrado web, control de navegación HTTP/HTTPS                           | **Squid**                                      |

#### 🌐 Zona DMZ (semi-confiable)

| VM      | Rol / Categoría principal | vCPU | RAM  | Disco GB | NICs    | Funciones clave                                           | Software principal                                         |
| ------- | ------------------------- | ---- | ---- | -------- | ------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| **VM4** | **Web Server**            | 2    | 3 GB | 25       | 1 (DMZ) | Hospedaje de sitios web con PHP, SSL/TLS, seguridad web | **Apache2** + **PHP** + **Certbot**                         |
| **VM5** | **IDS + Honeypot**        | 2    | 4 GB | 30       | 1 (DMZ) | Detección de intrusos en DMZ y trampas activas            | **Suricata** + **Cowrie** (SSH/Telnet) + **Dionaea** |

#### 🔐 Zona Interna (LAN segura)

| VM      | Rol / Categoría principal     | vCPU | RAM  | Disco GB | NICs        | Funciones clave                                                  | Software principal                                    |
| ------- | ----------------------------- | ---- | ---- | -------- | ----------- | ---------------------------------------------------------------- | ----------------------------------------------------- |
| **VM6** | **Servidor de Autenticación** | 2    | 4 GB | 30       | 1 (Interna) | LDAP/Kerberos, políticas de sudo, control de acceso centralizado | **FreeIPA**                                           |
| **VM7** | **SIEM**                      | 4    | 8 GB | 100      | 1 (Interna) | Recolección y correlación de logs, dashboards, alertas           | **Wazuh Manager** + **ELK Stack** (Elasticsearch, Logstash, Kibana) |

#### 🛠️ Zona Monitoreo y Análisis

| VM      | Rol / Categoría principal | vCPU | RAM  | Disco GB | NICs          | Funciones clave                                      | Software principal                                   |
| ------- | ------------------------- | ---- | ---- | -------- | ------------- | ---------------------------------------------------- | ---------------------------------------------------- |
| **VM8** | **Monitoreo**             | 2    | 4 GB | 30       | 1 (Monitoreo) | Métricas de servidores y red, umbrales y alertas     | **Zabbix Server** + **MySQL**                       |
| **VM9** | **Forense & Scripts**     | 2    | 6 GB | 50       | 1 (Monitoreo) | Análisis post-intrusión, scripting de automatización | **Autopsy**, **Volatility**, **SleuthKit**, **Python** |

### 📋 Cobertura NIST CSF 2.0

| Función | VMs Responsables | Controles Técnicos Implementados |
|---------|------------------|-----------------------------------|
| **IDENTIFICAR** | VM6 (Auth), VM7 (SIEM), VM8 (Monitor) | FreeIPA Asset Discovery, Wazuh Asset Management, Zabbix Network Discovery |
| **PROTEGER** | VM1 (Firewall), VM2 (VPN), VM3 (Proxy), VM4 (Web), VM6 (Auth) | iptables Rules, WireGuard VPN, Squid Filtering, Apache SSL, LDAP/Kerberos |
| **DETECTAR** | VM1 (IDS), VM5 (IDS/Honeypot), VM7 (SIEM), VM8 (Monitor) | Suricata IDS, Cowrie+Dionaea Honeypots, Wazuh SIEM, Zabbix Monitoring |
| **RESPONDER** | VM7 (SIEM), VM9 (Forense) | Wazuh Incident Response Workflows, Forensics Toolkit |
| **RECUPERAR** | VM9 (Scripts), Todas (Backup) | Disaster Recovery Scripts, Automated Backup Systems, Configuration Management |

### 🚀 Flujo de Implementación Recomendado

1. **Preparación del Entorno VMware**
   - Configurar redes virtuales (4 segmentos de red)
   - Crear plantilla base de Debian 12
   - Establecer especificaciones de hardware

2. **Instalación Base Automatizada**
   - Desplegar VMs desde plantilla
   - Ejecutar scripts de hardening básico
   - Configurar logging centralizado

3. **Implementación por Zonas**
   - **Paso 1**: VM1 (Firewall) - Base de conectividad
   - **Paso 2**: VM7 (SIEM) - Centralización de logs
   - **Paso 3**: Resto de VMs según dependencias

4. **Integración y Pruebas**
   - Validar conectividad entre zonas
   - Probar flujo de logs hacia SIEM
   - Ejecutar simulaciones de incidentes

5. **Documentación y Evidencias**
   - Capturar evidencias de funcionamiento
   - Documentar procedimientos de administración
   - Generar reportes de cumplimiento NIST

### 🔍 Características de la Estructura

- **Modularidad**: Cada VM tiene su propia estructura de configuración independiente
- **Automatización**: Scripts de instalación y configuración automatizados con menús interactivos
- **Trazabilidad**: Logs detallados de instalación, configuración y operación
- **Mantenibilidad**: Utilidades de backup/restore para cada componente
- **Escalabilidad**: Estructura preparada para agregar nuevas VMs o servicios
- **Cumplimiento**: Alineación directa con NIST CSF 2.0 y rúbrica de evaluación
- **Evidencias**: Organización clara para la documentación del proyecto

### 📝 Próximos Pasos

Una vez definida la estructura, los siguientes pasos serían:

1. **Configuración del Entorno VMware**
2. **Desarrollo de Scripts de Automatización**
3. **Implementación VM por VM**
4. **Integración y Pruebas**
5. **Documentación Final y Entregables**

Esta estructura proporciona una base sólida y organizada para implementar el proyecto de ciberseguridad cumpliendo con todos los requisitos del NIST CSF 2.0 y las especificaciones de la rúbrica de evaluación de la FEI.