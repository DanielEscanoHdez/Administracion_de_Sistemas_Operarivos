# Acceso remoto VNC
<br>
<br>
2º ASIR - Daniel Escaño Hernández
<br>
![](./Capturas/vnc.jpg)
<br>
<br>
## 1. Windows: Slave VNC
<br>
<br>
Configurar las máquinas virtuales según el documento dado.
<br>
#### Captura configuración direccionamiento IP Windows 7 (Server):
![](./Capturas/5.png)
<br>
<br>
#### Captura configuración direccionamiento IP Windows 7 (Viewer):
![](./Capturas/4.png)
<br>
<br>
Descargar TightVNC. Esta es una herramienta libre disponible para Windows.
<br>
En el servidor VNC instalaremos TightVNC -> Custom -> Server. Esto es el servicio.
<br>
#### Captura de la instalación de TightVNC Server Windows 7 (Server):
![](./Capturas/7.png)
<br>
<br>
Revisar la configuración del cortafuegos del servidor VNC Windows para permitir VNC.
<br>
#### Captura de la configuración del cortafuegos para permitir VNC (Server):
![](./Capturas/9.png)
<br>
<br>
## 2 Windows: Master VNC
<br>
<br>
En el cliente Windows instalar TightVNC -> Custom -> Viewer.
<br>
Usaremos TightVNC Viewer. Esto es el cliente VNC.
<br>
<br>
#### Captura de la instalación de TightVNC Viewer Windows 7 (Viewer):
![](./Capturas/2.png)
<br>
<br>
## 2.1 Comprobaciones finales
<br>
Conectar desde Window Master hacia el Windows Slave.
<br>
Ir al servidor VNC y usar el comando netstat -n para ver las conexiones VNC con el cliente.
<br>
<br>
#### Captura de la conexión desde Windows Master hacia Windows Slave y comando netstat:
![](./Capturas/1.png)
<br>
<br>
