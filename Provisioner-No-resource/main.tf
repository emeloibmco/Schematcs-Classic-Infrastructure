data "ibm_compute_vm_instance" "vm_instance" {
  hostname    = "vsi01-provisioner"
  domain      = "ibm.cloud-landingzone.com"
}