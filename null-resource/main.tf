provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}

resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "null_resource" "win_vm" {
  

  connection {
    type = "winrm"
    password = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "Install-Module -Name VMware.PowerCLI -Force",
      "Get-Module VMware.PowerCLI -ListAvailable",
      "Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false"
    ]
  }
}
