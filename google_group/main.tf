module "group" {
  source            = "./module"
  for_each          = var.group_details
  group_email       = each.value.group_email
  group_name        = each.value.group_name
  group_description = each.value.group_description
  group_aliases     = each.value.group_aliases
}