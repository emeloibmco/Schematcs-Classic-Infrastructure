resource "null_resource" "keys" {


  provisioner "local-exec" {
    command = "ls"

  }
  
}
output "key" {
  value = "null_resource.keys.NOMBRE_DE_LA_LLAVE"
}

