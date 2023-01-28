## Usage

```hcl
module "vpc" {
  source                  = "git::https://github.com/muralisathenapally/tfm.git?ref=vpc"
  project_id              = "vm-test-nessus"
  vpc_name                = "testqww"
  shared_vpc_host         = false
  auto_create_subnetworks = false
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.100.10.0/24"
      subnet_region         = "us-east4"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.100.20.0/24"
      subnet_region         = "us-east4"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}
```

