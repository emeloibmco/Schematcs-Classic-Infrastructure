
provider "vsphere" {
  
  user           = "${var.user_vsphere}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.ip_address}"
  allow_unverified_ssl = true
  

} 

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}