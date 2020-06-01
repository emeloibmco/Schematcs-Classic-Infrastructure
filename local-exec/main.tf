resource "null_resource" "keys" {


  provisioner "remote-exec" {
    inline = [
      "ssh-keygen -m PEM -t rsa -f 'NOMBRE_DE_LA_LLAVE'"
    ]
  }
}
