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
  memory               = 2048
  disks                = [25]
  local_disk           = false
  ssh_key_ids           = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]

  

  connection {
    type = "winrm"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {


    inline = [
     
      "Install-Module -Name VMware.PowerCLI -Force",
      "Get-Module VMware.PowerCLI -ListAvailable",
      "Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false",
      "Connect-VIServer -Server ${var.vsphere_ip} -Protocol https -User ${var.vsphere_user} -Password ${var.vsphere_passwd}",
      "New-VM -Name ${var.vm_vsphere} -VMHost ${var.vsphere_ip} -ResourcePool Resources -DiskGB ${var.vsphere_disk} -DiskStorageFormat Thin -DataStore datastore1 -MemoryGB ${var.vsphere_memory}",

    ]
  }
}
