variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
} 

variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://console.bluemix.net/iam#/apikeys"
}

variable "vsi_name" {
  
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

variable "private_key" {
  
}

/* variable "user_name" {

}

variable "tunnel_password" {

}

variable "tunnel_host" {

} */
/* 
variable "user_vsphere" {

}

variable "vsphere_password" {
  
}

variable "ip_address" {
  
}

variable "datacenter" {

} */