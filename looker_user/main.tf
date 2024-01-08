resource "looker_user" "user" {
  for_each   = var.looker_users
  email      = each.value.email
  first_name = each.value.first_name
  last_name  = each.value.last_name
}

terraform {
  required_providers {
    looker = {
      source  = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}