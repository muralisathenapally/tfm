# Usage
```hcl
module "apikey" {
  source       = "git::https://github.com/muralisathenapally/tfm.git?ref=apiKeys"
  project_id   = "project-id"
  name         = "key-2"
  display_name = "sample-key-2"
  api_targets  = "storage.googleapis.com" ## if needed supply the api name or else keep "".
  allowed_referrers = ["*.gcp.com/*"] ## if needed supply url or else keep []
}
```
