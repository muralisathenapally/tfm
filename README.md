# tfm

```hcl
module "pubsub_topic" {
  source            = "git::https://github.com/muralisathenapally/tfm.git?ref=pubsub"
  project_id        = "project_id"
  topic_name        = "topic_name"
  topic_labels      = { environment = "production" }
  pubsub_permission = "roles/pubsub.publisher" ## possible roles - https://cloud.google.com/pubsub/docs/access-control#roles
  members           = ["user:example@gmail.com"]
}
```
