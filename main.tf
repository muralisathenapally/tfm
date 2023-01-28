module "vpc" {
  source                  = "./vpc"
  project_id              = var.project_id
  vpc_name                = var.vpc_name
  subnets                 = var.subnets
  shared_vpc_host         = var.shared_vpc_host 
  auto_create_subnetworks = var.auto_create_subnetworks
}