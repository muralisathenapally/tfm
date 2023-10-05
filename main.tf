resource "google_pubsub_topic" "topic" {
  name    = var.topic_name
  labels  = var.topic_labels
  project = var.project_id
}

resource "google_pubsub_topic_iam_binding" "binding" {
  project = var.project_id
  topic   = google_pubsub_topic.topic.name
  role    = var.pubsub_permission
  members = var.members
}