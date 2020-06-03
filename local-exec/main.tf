resource "null_resource" "keys" {


  provisioner "local-exec" {
    command = "ping 10.221.114.41"

  }
  
}

