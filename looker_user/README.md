# tfm

```hcl
terraform {
  required_providers {
    looker = {
      source  = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}

provider "looker" {
  base_url      = "https://develop-looker.google.com/api/"
  client_id     = "12345678"
  client_secret = "abcd1234"
}


module "user" {
  source = "git::https://github.com/muralisathenapally/tfm.git//looker_user?ref=looker"
  looker_users = {
    "user1" = {
      email      = "mytestusr@gmail.com"
      first_name = "mytest"
      last_name  = "usr"
    }
  }
}
```