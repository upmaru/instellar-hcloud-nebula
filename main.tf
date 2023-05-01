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
variable "instellar_hcloud_token" {}

//--------------------------------------------------------------------
// Modules
module "instellar" {
  source  = "upmaru/instellar/hcloud"
  version = "0.1.11"

  hcloud_token = var.instellar_hcloud_token
  cluster_size = 1
  cluster_name = "nebula"
  ssh_keys = [
    "zack-one-eight",
    "zack-mac-studio"
  ]
}