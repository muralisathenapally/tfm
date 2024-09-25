variable "users" {
  description = "List of users with group memberships"
  type = list(object({
    email      = string
    first_name = string
    last_name  = string
    memberships = list(string)
  }))
}