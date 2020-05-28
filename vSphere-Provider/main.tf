
/* provider "vsphere" {

  user           = "${var.user_vsphere}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.ip_address}"
  allow_unverified_ssl = true

} */
/* 
data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
} */

resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "${var.vsi_name}"
  domain                     = "ibm.cloud-landingzone.com"
  os_reference_code          = "${var.os_reference}"
  datacenter                 = "${var.datacenter}"
  network_speed              = 100
  hourly_billing             = true
  private_network_only       = false
  cores                      = 1
  memory                     = 1024
  disks                      = [25]
  local_disk                 = false
  ssh_key_ids                = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]
  
  connection {
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "yes | sudo apt-get update", 
      "cd ..",
      "touch data.txt", 
      "echo 'Esta es una demo provisioner remote-exec' >> data.txt"
    ]
  }
  timeouts {
    delete = "5m"
  }
}
