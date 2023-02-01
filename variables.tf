variable "project_id" {
  type        = string
  description = "Enter the Projec ID"
}
variable "iam_bindings" {
  type        = map(list(string))
  description = <<EOF
                Map of role (key) and list of members (value) to add the IAM bindings. 
                Ex: { "roles/compute.networkAdmin" = ["user:my-user@my-org.com","serviceAccount:my-sa@my-project.iam.gserviceaccount.com","group:my-group@my-org.com"] }
                EOF
}