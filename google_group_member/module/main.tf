resource "googleworkspace_group_member" "manager" {
  group_id = var.group_id
  email    = var.member_email
  role     = var.member_role
}