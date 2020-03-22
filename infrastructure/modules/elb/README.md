## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| aws\_lb\_security\_group\_id | A list of security group IDs to assign to the ELB | `list(string)` | n/a | yes |
| cross\_zone\_load\_balancing | Enable cross-zone load balancing | `bool` | `true` | no |
| health\_check | A list of health check block | `list(map(string))` | n/a | yes |
| internal | If true, ELB will be an internal ELB | `bool` | `false` | no |
| listener | A list of listener blocks | `list(map(string))` | n/a | yes |
| name | The name of the ELB | `string` | n/a | yes |
| name\_prefix | The prefix name of the ELB | `string` | n/a | yes |
| subnets | A list of subnet IDs to attach to the ELB | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_elb\_name | The id of the ELB |
