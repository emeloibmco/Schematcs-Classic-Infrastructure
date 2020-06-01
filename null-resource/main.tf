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
      "sudo apt-get update",
      "sudo apt-get upgrade",
      "cd ..",
      "mkdir terraform && cd terraform",
      "wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip"
      "unzip terraform_0.11.14_linux_amd64.zip",
      "export PATH=$PATH:$HOME/terraform",
      "terraform"
    ]
  }
}
