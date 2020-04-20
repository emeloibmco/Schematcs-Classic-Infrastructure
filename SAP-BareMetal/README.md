# BareMetal-SAP - Schematics IBM Cloud

_Ejemplo de BareMetal-SAP con facturación por **MENSUAL** en Infraestructura clásica usando IaC en Schematics con el provider de Terraform_

<img width="940" alt="BareMetal-Architecture" src="images/baremetal.jpg">

## Comenzando 🚀

_Instrucciones_

Para el aprovisionamiento de un BareMetal-SAP se requiere facturación mensual la cual cuenta con minimo 3 archivos en GITHUB los cuales son:
- variable.tf = Contiene las variables de llaves y nombres unicos que el cliente introduce en su servicio
- main.tf = Archivo principal que contiene las funciones de aprovisionamiento de recursos 
- provider.tf = Instalador de provider IBM sobre Schematics


### Variables 📋

El aprovisionamiento de un BareMetal mensual con el provider terraform cuenta con las siguientes caracteristicas:

| Variable | Información |
| ------------- | ------------- |
| **ibmcloud_apikey**  | [API key](https://cloud.ibm.com/docs/iam?topic=iam-userapikey) unica del usuario que se requiere para aprovisionamiento de recursos |
| **ibm_region**  | Region en la que se encuentra ubicado el datacenter donde se aprovisionará el recurso |
| **bm_hostname** | Nombre del BareMetal a provisionar _No mayusculas_ |
| **bm_os_reference_code** | Referencia del paquete de sistemas operativos a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida)|
|**datacenter**| [Datacenter](https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json) en el cual se aprovisionará el BareMetal |
| **bm_domain** | Dominio del Baremetal ´nombre del dominio´.cloud.com |
| **bm_network_speed** | Velocidad de la red |
| **private_network** | Si se requiere de un enlace a la red publica se coloca _false_ de lo contrario _true_ |
| **processor** | [Script con nombres clave de paquetes de procesador](https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}) a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida|
| **key_process** | [Script con nombres clave de procesador](https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}) a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida |
| **disk_key_name** | Nombre clave de disco(s) de almacenamiento |
| **notes** | Notas de información del BareMetal |


Para acceder a información de **api softlayer** se requiere de la [APIkey-ClassicInfrastructure](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys&locale=es) y el usuario de la cuenta 

La variable **bm_os_reference_code** cuenta con las siguientes opciones para SAP - Certified

- OS_WINDOWS_SERVER_2019_DATACENTER_EDITION_64BIT ( Windows Server 2019 Datacenter Edition (64 bit) )
- OS_WINDOWS_2016_FULL_STD_64_BIT ( Windows Server 2016 Standard Edition (64 bit) )
- OS_WINDOWS_SERVER_2016_DATACENTER_EDITION_64_BIT (  Windows Server 2016 Datacenter Edition (64 bit) )
- OS_WINDOWS_SERVER_2016_DATACENTER_EDITION_64_BIT (  Windows Server 2016 Datacenter Edition (64 bit) )
- OS_RHEL_FOR_SAP_BUSINESS_APPLICATION_7_X_64_BIT ( Red Hat Enterprise Linux for SAP Business Application 7.x (64 bit) ) 
- OS_RHEL_FOR_SAP_BUSINESS_APPLICATION_6_5_64_BIT ( Red Hat Enterprise Linux for SAP Business Application 6.x (64 bit) )
- OS_SUSE_LINUX_ENTERPRISE_SERVER_15_FOR_SAP_APPLICATIONS ( SUSE Linux Enterprise Server 15 for SAP Applications )
- OS_SUSE_LINUX_ENTERPRISE_SERVER_12_SP2_FOR_SAP_APPLICATIONS ( SUSE Linux Enterprise Server 12 SP2 for SAP Applications  ) 

El atributo **disk_key_name** cuenta con las siguientes opciones

- HARD_DRIVE_1_7_TB_SSD_3_DWPD ( 1.7TB SSD (3 DWPD) ) 
- HARD_DRIVE_8_00_TB_SATA ( 8.00 TB SATA  ) 
- HARD_DRIVE_960GB_SSD ( 960GB SSD (3 DWPD) ) 
- HARD_DRIVE_4_00TB_SATA_III ( 4.00 TB SATA  ) 
- HARD_DRIVE_600_GB_SAS_15K_RPM ( 600 GB SAS (15K RPM) ) 
- HARD_DRIVE_960GB_SSD_SED_5DWPD ( 960GB SSD SED (5DWPD) ) 
- HARD_DRIVE_800GB_SSD ( 800GB SSD (10 DWPD) )
- HARD_DRIVE_1_2_TB_SSD_10_DWPD ( 1.2TB SSD (10 DWPD) ) 
- HARD_DRIVE_1_9TB_SSD_SED_5DWPD ( 1.9TB SSD SED (5DWPD) ) 
- HARD_DRIVE_2_00_TB_SATA_2 ( 2.00 TB SATA )

### Pasos para el despliegue en Schematics 🔧

Se debe dirigir al simbolo de ![](images/menu.JPG) en donde encontrará la opción de **Schematics** una vez alli se creará un nuevo workspace donde se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="images/workspace.JPG">

En el espacio sobremarcado con rojo se debe pegar el link del repositorio y de ser necesario en la parte de abajo el Token para permisos de acceso. Se presiona el botón sobremarcado con amarillo para adquirir las variables a rellenar. Luego de rellenarlas se debe crear el workspace. En caso de realizar el procedimiento de forma correcta se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="images/workspace1.JPG">

Se debe generar el plan con el botón que aparece en pantalla y de generarse correctamente se podrá aplicar el plan. _Solo hasta aplicar el plan se va a generar facturación_

---
#### Autores: IBM Cloud Tech Sales
