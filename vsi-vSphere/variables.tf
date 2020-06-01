variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
}

variable "datacenter" {
  description = "Datacenter where is locate VMware service"
  default = "dal10"
}

variable "ssh_label" {
  description = "Name of SSH-KEY"
  default = "Personal"
}

variable "ssh_public_key" {
}

variable "vm_name" {
  description = "Name of VSI that is going to execute the vSphere template"
}

variable "private_key" {

}

variable "vsphere_terraform" {
  description = "URL that contains template in GitHub"
}

variable "temp_vsphere" {
  description = "Path of the directory that contains the vSphere template"
}

variable "vsphere_ip" {
  description = "Ip address of vSphere BareMetal"
}

variable "vsphere_user" {
  description = "User of vSphere BareMetal"
}

variable "vsphere_passwd" {
  description = "Password of vSphere BareMetal"
}

variable "vsphere_disk" {
  description = "Capability of storage of New Virtual Machine in GB"
}

variable "vsphere_memory" {
  description = "RAM of New Virtual Machine in GB"
}

variable "vm_vsphere" {
  description = "Name of the New Virtual Machine"
}