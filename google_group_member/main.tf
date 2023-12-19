module "group_members" {
  source       = "./module"
  for_each     = var.group_members_assignments
  group_id     = each.value.group_id
  member_email = each.value.member_email
  member_role  = each.value.member_role
}