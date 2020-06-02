provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  connection {
    host = "169.48.173.217"
    type = "ssh"
    user = "root"
    password = "mF3FXqds"
  }

  provisioner "remote-exec" {
    inline = [
      "terraform"
    ]
  }
}
