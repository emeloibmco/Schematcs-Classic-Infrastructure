variable "ibmcloud_api_key" { description = "Set IBM Cloud Api Key" }
variable "ssh_key_name" { description = "Set SSH-KEY name"}
variable "ssh_label" {  }
variable "ssh_public_key" {  }

provider "ibm" {
    ibmcloud_api_key    = "${var.ibmcloud_api_key}"
}

resource "null_resource" "get_keys" {
    provisioner "local-exec" {
        command = "ssh-keygen -m PEM -t rsa -f '${var.ssh_key_name}' && ls"
    }   
}

resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}.pub"
}

