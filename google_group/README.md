# Usage

```hcl
provider "googleworkspace" {
  credentials = "key.json"
  customer_id = "A01b123xz"
}

module "grp" {
  source = "../"
  group_details = {
    group1 = {
      group_email       = "sales@example.com"
      group_name        = "sales"
      group_description = "sales"
      group_aliases     = ["paper-sales@example.com", "sales-dept@example.com"]
    },
      group2 = {
      group_email       = "sales@example.com"
      group_name        = "sales"
      group_description = "sales"
      group_aliases     = ["paper-sales@example.com", "sales-dept@example.com"]
    }
  }
}
```