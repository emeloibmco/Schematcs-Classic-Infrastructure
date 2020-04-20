# Configuración del provider con APIKEY y la región a trabajar
provider ibm {
  ibmcloud_api_key      = "${var.ibmcloud_apikey}"
  region                = "${var.ibm_region}"
  generation            = 1
  ibmcloud_timeout      = 60
}

