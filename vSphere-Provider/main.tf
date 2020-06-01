
provider "vsphere" {
  
  user           = "${var.user_vsphere}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.ip_address}"
  allow_unverified_ssl = true
  

} 

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
} 

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = "${var.vm_memory}"
  guest_id = "centos8_64Guest"

  disk {
    label       = "disk1"
    size        = "${var.vm_disk}"
  }

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }
}

