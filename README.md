# tfm

module "apikey" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=apiKeys"
  project_id = "rare-daylight-390015"
  name         = "key-2"
  display_name = "sample-key-2"
  api_targets  = "storage.googleapis.com"
}