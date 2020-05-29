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
  os_reference_code          = "${var.os_reference}"
  datacenter                 = "${var.datacenter}"
  network_speed        = 100
  hourly_billing       = true
  private_network_only = false
  cores                = 1
  memory               = 1024
  disks                = [25]
  local_disk           = false
  ssh_key_ids           = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "cd ..",
      "wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb",
      "sudo dpkg -i packages-microsoft-prod.deb",
      "yes | sudo apt-get update",
      "sudo apt-get install -y powershell",
      "sudo pwsh",
      "install-module -name VMware.PowerCLI -Force",
      "Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false",
      "Connect-VIServer -Server ${var.vsphere_ip} -Protocol https -User ${var.vsphere_user} -Password ${var.vsphere_passwd}",
      "New-VM -Name ${var.vm_vsphere} -VMHost ${var.vsphere_ip} -ResourcePool Resources -DiskGB ${var.vsphere_disk} -DiskStorageFormat Thin -DataStore datastore1 -MemoryGB ${var.vsphere_memory}",

    ]
  }
}
