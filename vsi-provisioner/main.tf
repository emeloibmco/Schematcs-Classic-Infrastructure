data "ibm_compute_bare_metal" "BM" {
  hostname    = "${var.bm_hostname}"
  domain      = "${var.bm_domain}"
  most_recent = true

  provisioner "remote-exec" {
    script = "install-viewer.sh"
  }
}