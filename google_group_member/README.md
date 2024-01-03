# Usage

```hcl
provider "googleworkspace" {
  credentials = "key.json"
  customer_id = "A01b123xz"
}

module "grp_members" {
  source = "../"
  group_members_assignments = {
    "member1" = {
      group_id       = "mygroupid"
      member_email        = "sales@example.com"
      member_role = "MEMBER"
    },
    "member2" = {
      group_id       = "mygroupid"
      member_email        = "sales@example.com"
      member_role = "MEMBER"
    },
  }
}
```