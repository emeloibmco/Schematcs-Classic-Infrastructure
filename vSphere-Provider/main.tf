
provider "vsphere" {
  user           = "${var.user_vsphere}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.ip_address}"

}

datos "vsphere_datacenter" "dc" {
  nombre = "DC"
}