
provider "esxi" {
  esxi_hostname      = "${var.ip_address}"
  esxi_hostport      = "443"
  esxi_username      = "${var.user_vsphere}"
  esxi_password      = "${var.vsphere_password}"

}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}