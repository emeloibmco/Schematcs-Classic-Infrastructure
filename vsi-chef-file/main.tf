provider "ibm" {
  ibmcloud_api_key    = "${var.ibmcloud_api_key}"

}

resource "ibm_compute_ssh_key" "ssh_key_bin" {
  label      = "${var.ssh_label}"
  public_key = "${var.ssh_public_key}"
}

resource "ibm_compute_vm_instance" "terraform_p_sample" {
  hostname                   = "vsi02-chef"
  domain                     = "ibm.cloud-landingzone.com"
  os_reference_code          = "${var.os_reference}"
  datacenter                 = "${var.datacenter}"
  network_speed        = 100
  hourly_billing       = true
  private_network_only = false
  cores                = 1
  memory               = 1024
  disks                = [25]
  local_disk           = false
  ssh_key_ids           = [ "${ibm_compute_ssh_key.ssh_key_bin.id}" ]

  connection {
    type = "ssh"
    user = "root"
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "yes | sudo apt-get update", 
      "cd ..",
      "wget -nv -P /downloads https://packages.chef.io/files/stable/chef-workstation/0.18.3/ubuntu/18.04/chef-workstation_0.18.3-1_amd64.deb",
      "dpkg -i /downloads/chef-workstation_0.18.3-1_amd64.deb",
      "echo yes | chef generate repo chef-repo",
      "cd chef-repo/cookbooks",
      "git clone https://github.com/JulianaLeonGonzalez/cookbook.git",
      "cd ..",
      "chef-client --local-mode --override-runlist cookbook"
    ]
  }
}
