variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
}

variable "os_reference" {
  description = ""
  default = "UBUNTU_18_64"
}

variable "datacenter" {
  description = ""
  default = "dal10"
}

variable "ssh_label" {
  default = "Personal"
}

variable "ssh_public_key" {
}

variable "vm_name" {}

variable "private_key" {}

variable "vsphere_ip" {}

variable "vsphere_user" {}

variable "vsphere_passwd" {}

variable "vsphere_disk" {}

variable "vsphere_memory" {}

variable "vm_vsphere" {}