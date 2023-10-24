resource "google_apikeys_key" "primary" {
  name         = var.name
  display_name = var.display_name
  project      = var.project

  restrictions {
    api_targets {
      service = var.api_targets
    }
  }
}