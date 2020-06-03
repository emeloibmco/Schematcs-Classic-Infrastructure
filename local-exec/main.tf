resource "null_resource" "keys" {


  provisioner "local-exec" {
    command = "wget https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_327/MP_Linux_1.2.6/MotionPro_Linux_Ubuntu_x64_v1.2.6.sh && chmod +x MotionPro_Linux_Ubuntu_x64_v1.2.6.sh && ./MotionPro_Linux_Ubuntu_x64_v1.2.6.sh && MotionPro -h http://vpn.dal.softlayer.com -u 2059386_acoyp@ibm.com -p 1Ejijiye- && ping 10.221.114.41"

  }
  
}

