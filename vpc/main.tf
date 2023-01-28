module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 6.0"

  project_id              = var.project_id
  network_name            = var.vpc_name
  routing_mode            = "GLOBAL"
  shared_vpc_host         = var.shared_vpc_host
  auto_create_subnetworks = var.auto_create_subnetworks

  subnets = var.subnets
}