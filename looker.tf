terraform {
  required_providers {
    looker = {
      source = "hirosassa/looker"
      version = "0.9.0"
    }
  }
}

provider "looker" {
  base_url      = "https://develop-looker.google.com/api/"
  client_id     = "12345678"
  client_secret = "abcd1234"
}

resource "looker_user" "user" {
  email      = "mytestusr@email.com"
  first_name = "Test"
  last_name  = "API User"
}

resource "looker_group" "group" {
  name = "mytestgrp"
}
