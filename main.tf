resource "google_pubsub_topic" "topic" {
  name           = var.topic_name
  labels         = var.topic_labels
  project        = var.project_id
}
