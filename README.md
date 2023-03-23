## Usage

```hcl
module "docker_artifact_registry" {
  source     = "git::https://github.com/muralisathenapally/tfm.git?ref=artifact_registry"
  project_id = "united-lane-354904"
  location   = "us-east1"
  format     = "DOCKER"
  id         = "myregistry"
  iam = {
    "roles/artifactregistry.admin" = ["user:archer.murali@gmail.com"]
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | An optional description for the repository | `string` | `"Terraform-managed registry"` | no |
| <a name="input_format"></a> [format](#input\_format) | Repository format. One of DOCKER or UNSPECIFIED | `string` | `"DOCKER"` | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_iam_additive"></a> [iam\_additive](#input\_iam\_additive) | IAM additive bindings in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_id"></a> [id](#input\_id) | Repository id | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to be attached to the registry. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Registry location. Use `gcloud beta artifacts locations list' to get valid values` | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Registry project id. | `string` | n/a | yes |



## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Repository id |
| <a name="output_name"></a> [name](#output\_name) | Repository name |