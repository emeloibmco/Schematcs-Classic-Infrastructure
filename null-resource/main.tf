provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  provisioner "local_exec" {
    command = "${var.command}"
     
  }
}
