# Configuración de permisos con la  API_KEY para el aprovisionamiento de recursos
provider ibm {
  ibmcloud_api_key      = "${var.ibmcloud_apikey}"
  region                = "${var.ibm_region}"
  generation            = 1
  ibmcloud_timeout      = 60
}

