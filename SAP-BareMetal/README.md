# BareMetal-SAP - Schematics IBM Cloud

_Ejemplo de BareMetal-SAP con facturación por **MENSUAL** en Infraestructura clásica usando IaC en Schematics con el provvider de Terraform_

<img width="940" alt="BareMetal-Architecture" src="">

## Comenzando 🚀

_Instrucciones_

Para el aprovisionamiento de un BareMetal-SAP se requiere facturación mensual la cual cuenta con minimo 3 archivos en GITHUB los cuales son:
- variable.tf = Contiene las variables de llaves y nombres unicos que el cliente introduce en su servicio
- recursos.tf = Solicita aprovisionamiento del servicio que se requiere (en este caso BareMetal)
- provider.tf = Instalador de provider IBM sobre Schematics


### variables 📋

El aprovisionamiento de un BareMetal mensual con el provider terraform cuenta con las siguientes caracteristicas:

| Variable | Información |
| ------------- | ------------- |
| **ibmcloud_apikey**  | [API key](https://cloud.ibm.com/docs/iam?topic=iam-userapikey) unica del usuario que se requiere para aprovisionamiento de recursos |
| **ibm_region**  | Region en la que se encuentra ubicado el datacenter donde se aprovisionará el recurso |
| **resource_group** | Grupo de recursos en cual se aprovisiona el recurso |
| **hostname** | Nombre del BareMetal a provisionar _No mayusculas_ |
| **package_key** | [Referencia del paquete de sistemas operativos](https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}) a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida|
| **process_key_name** | [Referencia del paquete de sistemas operativos](https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}) a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida|
| **memory** | Memoria RAM requerida para |
|**datacenter**| [Datacenter](https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json) en el cual se aprovisionará el BareMetal |
| **domain** | Dominio del Baremetal ´nombre del dominio´.cloud.com |
| **network_speed** | Velocidad de la red |
| **private_network** | Si se requiere de un enlace a la red publica se coloca _false_ de lo contrario _true_ |
| **notes** | Notas de información del BareMetal |
| **disk_key_name** | [Nombre clave de disco(s)](https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}) de almacenamiento 



Para acceder a información de **api softlayer** se requiere de la [APIkey-ClassicInfrastructure](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys&locale=es) y el usuario de la cuenta 


### Pasos para el despliegue en Schematics 🔧

Se debe dirigir al simbolo de ![](images/menu.JPG) en donde encontrará la opción de **Schematics** una vez alli se creará un nuevo workspace donde se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="images/workspace.JPG">

En el espacio sobremarcado con rojo se debe pegar el link del repositorio y de ser necesario en la parte de abajo el Token para permisos de acceso. Se presiona el botón sobremarcado con amarillo para adquirir las variables a rellenar. Luego de rellenarlas se debe crear el workspace. En caso de realizar el procedimiento de forma correcta se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="images/workspace1.JPG">

Se debe generar el plan con el botón que aparece en pantalla y de generarse correctamente se podrá aplicar el plan. _Solo hasta aplicar el plan se va a generar facturación_

---
#### Autores: IBM Cloud Tech Sales
