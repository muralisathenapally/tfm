resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "googleworkspace_user" "user" {
  primary_email = var.primary_email
  password      = random_password.password.result
  hash_function = "MD5"
  name {
    family_name = var.family_name
    given_name  = var.given_name
  }
}