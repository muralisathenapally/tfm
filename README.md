# Usage
```hcl
module "apikey" {
  source       = "git::https://github.com/muralisathenapally/tfm.git?ref=apiKeys"
  project_id   = "project-id"
  name         = "key-2"
  display_name = "sample-key-2"
  api_targets  = "storage.googleapis.com"
}
```
