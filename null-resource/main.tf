provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {
  

  connection {
    type = "winrm"
    host = "${var.host_connection}"
    password = "${var.password}"
  }

  provisioner "remote-exec" {
    inline = [
      "Install-Module -Name VMware.PowerCLI -Force",
      "Get-Module VMware.PowerCLI -ListAvailable",
      "Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false"
    ]
  }
}
