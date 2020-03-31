variable ibmcloud_apikey {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
}

variable ibm_region {
  description = "IBM Cloud region where all resources will be deployed"
  default     = "us-south"
}

variable resource_group {
  description = "Name of resource group to provision resources"
  default     = "landing-zone"
}

variable "bm_hostname" {
  default = "BareMetal01"
}

variable "bm_os_reference_code" {
  description = "Default is No Operating System - More info : https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json" 
  default = "CUSTOS_1_64"
}

variable "datacenter" {
  default = "dal06"
}


variable "bm_domain" {
  default = "baremetal01.ibm.com"
}

variable "bm_network_speed" {
  default = 100
}

variable "private_network" {
  description = "true or false"
  default = "false"
}


variable "notes_bm" {
  default = "test"
}

variable "processor" {
  description = "SAP Certified Hourly 4 Cores BI_S1_NW32 - More info: https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}} "
  }

variable "hourly_billing" {
  default = "true"
}
