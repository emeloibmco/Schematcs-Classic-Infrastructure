provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  connection {
    host = "169.62.137.216"
    type = "ssh"
    user = "root"
    password = "bp4ajCcR"
  }

  provisioner "remote-exec" {
    inline = [
      "./terraform_exec.sh"
    ]
  }
}
