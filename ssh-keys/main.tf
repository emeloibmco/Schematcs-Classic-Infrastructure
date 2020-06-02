variable "ibmcloud_api_key" { description = "Set IBM Cloud Api Key" }
variable "ssh_key_name" { description = "Set SSH-KEY name"}

provider "ibm" {
    ibmcloud_api_key    = "${var.ibmcloud_api_key}"
}

resource "null_resource" "get_keys" {
    provisioner "local-exec" {
        command = "ssh-keygen -m PEM -t rsa -f '${var.ssh_key_name}' && ls"
    }
    
}

