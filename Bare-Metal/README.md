# BareMetal guide - Schematics IBM Cloud

_Ejemplo de BareMetal en Infraestructura clásica usando IaC en Schematics_

![BareMetal-Architecture](https://github.com/emeloibmco/Schematics-Classic-Infrastructure-BareMetal/blob/master/Bare-Metal/baremetal.JPG)

## Comenzando 🚀

_Instrucciones_

Para el aprovisionamiento de un BareMetal se debe contar con minimo 3 archivos en GITHUB los cuales son:
- variable.tf = Contiene las variables de llaves y nombres unicos que el cliente introduce en su servicio
- recursos.tf = Solicita aprovisionamiento del servicio que se requiere (en este caso BareMetal)
- provider.tf = Instalador de provider IBM sobre Schematics


### Pre-requisitos 📋

_Necesitas una cuenta en IBM Cloud_


### Pasos de acceso a api_softlayer 🔧

_En este codigo se tiene que tener en cuenta 
_Para obtener la apikey_softlayer se debe ir a **Access(IAM)>Users>"Tu usuario">Classic infrastructure"**_



---
⌨️ con ❤️ por Fernando Coy 😊
