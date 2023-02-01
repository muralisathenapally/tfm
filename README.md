## Usage

```hcl
module "iam" {
  source                  = "git::https://github.com/muralisathenapally/tfm.git?ref=iam"
  project_id              = "united-lane-354904"
  bindings = { 
      "roles/compute.networkAdmin" = ["user:my-user@my-org.com","serviceAccount:my-sa@my-project.iam.gserviceaccount.com","group:my-group@my-org.com"],
      "roles/bigquery.user" = ["user:my-user@my-org.com","serviceAccount:my-sa@my-project.iam.gserviceaccount.com","group:my-group@my-org.com"]
      }
}
```

