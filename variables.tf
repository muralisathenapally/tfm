variable "name" {
  description = "name of the api key"
}
variable "display_name" {
  description = "description for the key"
}
variable "project_id" {
  description = "project id"
}
variable "api_targets" {
  description = "restrict the key to particular api by specifying it api format. ex: bigquery.googleapis.com"
}

variable "allowed_referrers" {
  description = "list of regular expressions for the referrer URLs that are allowed to make API calls with this key"
}