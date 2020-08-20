resource "ibm_compute_bare_metal" "baremetal01" {
  
  hostname                   = "${var.bm_hostname}"
  domain                     = "${var.bm_domain}"
  memory                     =  32
  os_key_name                = "${var.bm_os_reference_code}"
  datacenter                 = "${var.datacenter}"
  hourly_billing             = false
  network_speed              = "${var.bm_network_speed}"
  private_network_only       = "${var.private_network}"
  package_key_name           = "${var.processor}"
  process_key_name           = "${var.key_process}"
  public_bandwidth           = 500
  disk_key_names             = ["${var.disk_key_name}"]
  notes                      = "${var.notes_bm}"
    
  }

