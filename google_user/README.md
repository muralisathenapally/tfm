# Usage

```hcl
provider "googleworkspace" {
  credentials = "key.json"
  customer_id = "A01b123xz"
}

module "google_users" {
  source = "../"
  googleworkspace_users = {
    "user1" = {
      primary_email     = "sales@example.com"
      family_name        = "sales"
      given_name = "salets"
    },
    "user2" = {
      primary_email     = "saleas@example.com"
      family_name        = "saleas"
      given_name = "saleas"
    }
  }
}
```