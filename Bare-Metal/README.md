# BareMetal guide - Schematics IBM Cloud

_Ejemplo de BareMetal con facturación por **HORAS** en Infraestructura clásica usando IaC en Schematics con el provvider de Terraform_

<img width="940" alt="/images/BareMetal-Architecture" src="baremetal.JPG">

## Comenzando 🚀

_Instrucciones_

Para el aprovisionamiento de un BareMetal se debe contar con minimo 3 archivos en GITHUB los cuales son:
- variable.tf = Contiene las variables de llaves y nombres unicos que el cliente introduce en su servicio
- recursos.tf = Solicita aprovisionamiento del servicio que se requiere (en este caso BareMetal)
- provider.tf = Instalador de provider IBM sobre Schematics


### variables 📋

El aprovisionamiento de un BareMetal con el provider terraform requiere de por lo menos las siguientes variables:

| Variable | Información |
| ------------- | ------------- |
| **ibmcloud_apikey**  | [API key](https://cloud.ibm.com/docs/iam?topic=iam-userapikey) unica del usuario que se requiere para aprovisionamiento de recursos |
| **ibm_region**  | Region en la que se encuentra ubicado el datacenter donde se aprovisionará el recurso |
| **resource_group** | Grupo de recursos en cual se aprovisiona el recurso |
| **hostname** | Nombre del BareMetal a provisionar _No mayusculas_ |
| **os_reference** | Referencia del sistema operativo a instalar sobre el BareMetal (Depende de la capacidad del procesador elegida|
|**datacenter**| [Datacenter](https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json) en el cual se aprovisionará el BareMetal |
| **domain** | Dominio del Baremetal ´nombre del dominio´.cloud.com |
| **network_speed** | Velocidad de la red |
| **private_network** | Si se requiere de un enlace a la red publica se coloca _false_ de lo contrario _true_ |
| **notes** | Notas de información del BareMetal |
| **fixed_config_preset** | [Procesador del BareMetal](https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json) Cores y memoria RAM  |


Para acceder a información de **api softlayer** se requiere de la [APIkey-ClassicInfrastructure](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys&locale=es) y el usuario de la cuenta 


### Pasos para el despliegue en Schematics 🔧

Se debe dirigir al simbolo de ![](menu.JPG) en donde encontrará la opción de **Schematics** una vez alli se creará un nuevo workspace donde se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="workspace.JPG">

En el espacio sobremarcado con rojo se debe pegar el link del repositorio y de ser necesario en la parte de abajo el Token para permisos de acceso. Se presiona el botón sobremarcado con amarillo para adquirir las variables a rellenar. Luego de rellenarlas se debe crear el workspace. En caso de realizar el procedimiento de forma correcta se contará con la siguiente pestaña:
<img width="945" alt="workspace" src="workspace1.JPG">

Se debe generar el plan con el botón que aparece en pantalla y de generarse correctamente se podrá aplicar el plan. _Solo hasta aplicar el plan se va a generar facturación_

---
#### Autores: IBM Cloud Tech Sales
