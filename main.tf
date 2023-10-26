resource "google_apikeys_key" "primary" {
  name         = var.name
  display_name = var.display_name
  project      = var.project_id

  restrictions {
    api_targets {
      service = var.api_targets
    }
    browser_key_restrictions {
      allowed_referrers = var.allowed_referrers
    }
  }
}