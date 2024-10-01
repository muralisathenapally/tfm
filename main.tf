terraform {
  required_providers {
    looker = {
      source  = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}

## Create Looker users for each entry in the 'users' list
resource "looker_user" "user" {
  for_each   = { for user in var.users : user.email => user }
  email      = each.value.email
  first_name = each.value.first_name
  last_name  = each.value.last_name
}

## Create a local that collects user IDs with their corresponding group memberships
locals {
  group_memberships = flatten([
    for user in var.users : [
      for group_id in user.memberships : {
        user_email = user.email
        group_id   = group_id
      }
    ]
  ])
}

## Create Looker group memberships based on the created users
resource "looker_group_membership" "group_membership" {
  for_each = {
    for membership in local.group_memberships :
    "${membership.user_email}-${membership.group_id}" => {
      user_id  = looker_user.user[membership.user_email].id
      group_id = membership.group_id
    }
  }

  target_group_id = each.value.group_id
  user_ids        = [each.value.user_id]
}
