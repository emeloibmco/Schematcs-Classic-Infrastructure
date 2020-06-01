provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}

resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "${var.vm_name}"
  domain                     = "ibm.cloud-landingzone.com"
  os_reference_code          = "UBUNTU_18_64"
  datacenter                 = "${var.datacenter}"
  network_speed              = 100
  hourly_billing             = true
  private_network_only       = false
  cores                      = 1
  memory                     = 2048
  local_disk                 = false
  ssh_key_ids                = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]

  

  connection {
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "snap install terraform",
      "git clone ${var.vsphere_terraform}",
      "ls",
      "cd ${var.temp_vsphere}",   
      "ls",   
      "terraform init",
      "terraform apply -var 'user_vsphere=${var.vsphere_user}' -var 'vm_name=${var.vm_vsphere}' -var 'vsphere_password=${var.vsphere_passwd}' -var 'ip_address=${var.vsphere_ip}' -var 'datacenter=ha_datacenter' -var 'vm_memory=${var.vsphere_memory}' -var 'vm_disk=${var.vsphere_disk}' -auto-approve"

    ]
  }
}
