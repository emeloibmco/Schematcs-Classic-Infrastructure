provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  connection {
    host = "169.48.173.214"
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/emeloibmco/Schematics-Classic-Infrastructure-BareMetal.git",
      "ls",
      "cd Schematics-Classic-Infrastructure-BareMetal/vSphere-Provider",   
      "ls",
      "terraform"
    ]
  }
}
