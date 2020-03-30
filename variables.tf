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
  description = "REDHAT_6_64, CENTOS_6_32, UBUNTU_12_64, CENTOS_6_64, DEBIAN_8_32, WIN_2008-STD-R2-SP1_64, UBUNTU_12_32, CENTOS_7_64, WIN_2003-STD-SP2-5_64, WIN_2012-STD_64, UBUNTU_16_64, WIN_2016-STD_64, DEBIAN_9_64, WIN_2019-STD_64, WIN_2012-STD-R2_64, UBUNTU_14_32, UBUNTU_18_64 ... RedHat is only avaliable in monthly billing" 
  default = "No_OS"
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

variable "hourly_billing" {
  default = "true"
}
