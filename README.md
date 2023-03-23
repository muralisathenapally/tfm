## Usage

```hcl
module "project-iam-bindings" {
  source   = "git::https://github.com/muralisathenapally/tfm.git?ref=iam"
  mode     = "additive"
  projects = ["united-lane-354904"]
  bindings = { 
      "roles/compute.networkAdmin" = ["user:my-user@my-org.com","serviceAccount:my-sa@my-project.iam.gserviceaccount.com","group:my-group@my-org.com"],
      "roles/bigquery.user" = ["user:my-user@my-org.com","serviceAccount:my-sa@my-project.iam.gserviceaccount.com","group:my-group@my-org.com"]
      }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bindings | Map of role (key) and list of members (value) to add the IAM policies/bindings | `map(list(string))` | `{}` | no |
| conditional\_bindings | List of maps of role and respective conditions, and the members to add the IAM policies/bindings | <pre>list(object({<br>    role        = string<br>    title       = string<br>    description = string<br>    expression  = string<br>    members     = list(string)<br>  }))</pre> | `[]` | no |
| mode | Mode for adding the IAM policies/bindings, additive and authoritative | `string` | `"additive"` | no |
| projects | Projects list to add the IAM policies/bindings | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| members | Members which were bound to projects. |
| projects | Projects wich received bindings. |
| roles | Roles which were assigned to members. |

