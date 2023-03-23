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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_create\_subnetworks | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| delete\_default\_internet\_gateway\_routes | If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted | `bool` | `false` | no |
| description | An optional description of this resource. The resource must be recreated to modify this field. | `string` | `""` | no |
| firewall\_rules | List of firewall rules | `any` | `[]` | no |
| mtu | The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively. | `number` | `0` | no |
| network\_name | The name of the network being created | `string` | n/a | yes |
| project\_id | The ID of the project where this VPC will be created | `string` | n/a | yes |
| routes | List of routes being created in this VPC | `list(map(string))` | `[]` | no |
| routing\_mode | The network routing mode (default 'GLOBAL') | `string` | `"GLOBAL"` | no |
| secondary\_ranges | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| shared\_vpc\_host | Makes this project a Shared VPC host if 'true' (default 'false') | `bool` | `false` | no |
| subnets | The list of subnets being created | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| network | The created network |
| network\_id | The ID of the VPC being created |
| network\_name | The name of the VPC being created |
| network\_self\_link | The URI of the VPC being created |
| project\_id | VPC project id |
| route\_names | The route names associated with this VPC |
| subnets | A map with keys of form subnet\_region/subnet\_name and values being the outputs of the google\_compute\_subnetwork resources used to create corresponding subnets. |
| subnets\_flow\_logs | Whether the subnets will have VPC flow logs enabled |
| subnets\_ids | The IDs of the subnets being created |
| subnets\_ips | The IPs and CIDRs of the subnets being created |
| subnets\_names | The names of the subnets being created |
| subnets\_private\_access | Whether the subnets will have access to Google API's without a public IP |
| subnets\_regions | The region where the subnets will be created |
| subnets\_secondary\_ranges | The secondary ranges associated with these subnets |
| subnets\_self\_links | The self-links of subnets being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Subnet Inputs

The subnets list contains maps, where each object represents a subnet. Each map has the following inputs :

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| subnet\_name | The name of the subnet being created  | string | - | yes |
| subnet\_ip | The IP and CIDR range of the subnet being created | string | - | yes |
| subnet\_region | The region where the subnet will be created  | string | - | yes |
| subnet\_private\_access | Whether this subnet will have private Google access enabled | string | `"false"` | no |
| subnet\_flow\_logs  | Whether the subnet will record and send flow log data to logging | string | `"false"` | no |

### Route Inputs

The routes list contains maps, where each object represents a route. For the next_hop_* inputs, only one is possible to be used in each route. Having two next_hop_* inputs will produce an error. Each map has the following inputs:

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the route being created  | string | - | no |
| description | The description of the route being created | string | - | no |
| tags | The network tags assigned to this route. This is a list in string format. Eg. "tag-01,tag-02"| string | - | yes |
| destination\_range | The destination range of outgoing packets that this route applies to. Only IPv4 is supported | string | - | yes
| next\_hop\_internet | Whether the next hop to this route will the default internet gateway. Use "true" to enable this as next hop | string | `"false"` | yes |
| next\_hop\_ip | Network IP address of an instance that should handle matching packets | string | - | yes |
| next\_hop\_instance |  URL or name of an instance that should handle matching packets. If just name is specified "next\_hop\_instance\_zone" is required | string | - | yes |
| next\_hop\_instance\_zone |  The zone of the instance specified in next\_hop\_instance. Only required if next\_hop\_instance is specified as a name | string | - | no |
| next\_hop\_vpn\_tunnel | URL to a VpnTunnel that should handle matching packets | string | - | yes |
| priority | The priority of this route. Priority is used to break ties in cases where there is more than one matching route of equal prefix length. In the case of two routes with equal prefix length, the one with the lowest-numbered priority value wins | string | `"1000"` | yes |
