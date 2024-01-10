# Usage

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

module "group" {
  source        = "git::https://github.com/muralisathenapally/tfm.git//looker_group?ref=looker"
  looker_groups_membership = {
    "membership1" = {
        target_group_id = "mygrp1"
        user_ids = ["testuser@gmail.com","dummyuser@gmail.com"]
    },
    "membership2" = {
        target_group_id = "mygrp2"
        user_ids = ["testuser@gmail.com","dummyuser@gmail.com"]
    }
  }
}
```