provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}


resource "null_resource" "win_vm" {

  provisioner "local-exec" {
    command = "wget https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_322/MP_Linux_1.2.6/MotionPro_Linux_Ubuntu_x64_v1.2.6.sh"
     
  }
  provisioner "local-exec" {
    command = "chmod +x MotionPro_Linux_Ubuntu_x64_v1.2.6.sh"
     
  }
  provisioner "local-exec" {
    command = "printf '%s\n' '#!/bin/bash' 'exit 0' | tee -a /etc/rc.local"
     
  }
  provisioner "local-exec" {
    command = "chmod +x /etc/rc.local"
     
  }
  provisioner "local-exec" {
    command = "./MotionPro_Linux_Ubuntu_x64_v1.2.6.sh"
     
  }
  provisioner "local-exec" {
    command = "ls"
     
  }

}
