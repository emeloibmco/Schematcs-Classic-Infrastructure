provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "vsi01-provisioner"
  domain                     = "ibm.cloud-landingzone.com"
  os_reference_code          = "${var.os_reference}"
  datacenter                 = "${var.datacenter}"
  network_speed        = 100
  hourly_billing       = true
  private_network_only = true
  cores                = 1
  memory               = 1024
  disks                = [25]
  local_disk           = false


  provisioner "remote-exec" {
    script = "install-viewer.sh"
  }
}
