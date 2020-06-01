provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  connection {
    host = "169.62.137.214"
    type = "ssh"
    user = "root"
    password = "a62T2QME"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "terraform"
    ]
  }
}
