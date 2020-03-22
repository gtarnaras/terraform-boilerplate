## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ami\_id | n/a | `string` | `"ami-0fc61db8544a617ed"` | no |
| env | n/a | `string` | `"test"` | no |
| instance\_type | n/a | `string` | `"t2.micro"` | no |
| subnet\_id | n/a | `any` | n/a | yes |
| vpc\_security\_group\_ids | List of VPC security group IDs | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ec2\_instance\_id | n/a |
