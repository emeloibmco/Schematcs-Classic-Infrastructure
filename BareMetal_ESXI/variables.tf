variable ibmcloud_apikey {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
}

variable ibm_region {
  description = "IBM Cloud region where all resources will be deployed"
  default     = "us-south"
}

variable "bm_hostname" {
  default = "BareMetal01"
}

variable "bm_os_reference_code" {
  description = "OS_VMWARE_SERVER_VIRTUALIZATION_6_5_0_U2 / OS_VMWARE_SERVER_VIRTUALIZATION_6_5_UPDATE_1G" 
}

variable "datacenter" {
  description = "More info - https://api.softlayer.com/rest/v3/SoftLayer_Hardware/getCreateObjectOptions.json"
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
  description = "More info: https://api.softlayer.com/rest/v3/SoftLayer_Product_Package/getAllObjects?objectFilter={%22type%22:{%22keyName%22:{%22operation%22:%22BARE_METAL_CPU%22}}}"
  }

variable "key_process" {
  default = "INTEL_SINGLE_XEON_1270_3_50"
  }

variable "disk_key_name" {
  description =" More info in Readme"
  default = "HARD_DRIVE_2_00_TB_SATA_2"
  }

