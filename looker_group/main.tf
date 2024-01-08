resource "looker_group" "group" {
  for_each = toset(var.looker_groups)
  name     = each.key
}

terraform {
  required_providers {
    looker = {
      source  = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}