variable "project_id" {
  description = "The Google Cloud Project ID"
}

variable "topic_name" {
  description = "The name of the Pub/Sub topic"
}

variable "topic_labels" {
  description = "Labels to be associated with the Pub/Sub topic"
  type        = map(string)
}

variable "pubsub_permission" {
  description = "pubsub iam role to grant to members on the topic being created"
}
variable "members" {
  description = "members list to grant access on topic level"
  type        = list(string)
}