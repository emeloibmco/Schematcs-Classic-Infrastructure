
provider "vsphere" {

  connection {
    type     = "ssh"
    user     = "${var.user_name}"
    password = "${var.tunnel_password}"
    host     = "${var.tunnel_host}"
  }

  user           = "${var.user_vsphere}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.ip_address}"

}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}