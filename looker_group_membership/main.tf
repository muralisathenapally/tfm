terraform {
  required_providers {
    looker = {
      source  = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}

resource "looker_group_membership" "group_membership" {
  for_each = var.looker_groups_membership
  target_group_id = each.value.target_group_id
  user_ids        = each.value.user_ids
}