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

variable "deletion_policy" {
  description = "The deletion policy for the Pub/Sub topic"
  type        = string
  default     = "NEVER"
}
