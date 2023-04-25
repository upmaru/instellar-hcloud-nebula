terraform {
  backend "remote" {
    organization = "upmaru"

    workspaces {
      name = "instellar-hcloud-nebula"
    }
  }
}

//--------------------------------------------------------------------
// Variables
variable "instellar_do_token" {}
variable "instellar_ip_range" {}

//--------------------------------------------------------------------
// Modules
module "instellar" {
  source  = "upmaru/instellar/hcloud"
  version = "0.1.1"

  do_token     = var.instellar_do_token
  cluster_size = 3
  cluster_name = "nebula"
  ssh_keys = [
    "zack-one-eight",
    "zack-mac-studio"
  ]
}