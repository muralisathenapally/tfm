module "users" {
  source        = "./module"
  for_each      = var.googleworkspace_users
  family_name   = each.value.family_name
  given_name    = each.value.given_name
  primary_email = each.value.primary_email
}

