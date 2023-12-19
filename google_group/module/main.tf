resource "googleworkspace_group" "group" {
  email       = var.group_email
  name        = var.group_name
  description = var.group_description
  aliases     = var.group_aliases
}