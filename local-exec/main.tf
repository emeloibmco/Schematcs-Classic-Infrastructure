resource "null_resource" "keys" {


  provisioner "local-exec" {
    command = "ssh-keygen -m PEM -t rsa -f 'NOMBRE_DE_LA_LLAVE'"

  }
  
}
output "key" {
  value = "null_resource.keys"
}

