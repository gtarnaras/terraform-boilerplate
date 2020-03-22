## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cidr\_block | The cidr block address | `string` | `"10.0.0.0/16"` | no |
| env | The environment name | `string` | `"test"` | no |
| ingress\_ports | list of ingress ports | `list(number)` | <pre>[<br>  80,<br>  423<br>]</pre> | no |
| protocol | The protocol type, could be TCP/UDP | `string` | `"-1"` | no |
| sg\_name | The security group name | `string` | `"sg_name"` | no |
| vpc\_id | The vpc id | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sg\_ports | n/a |
| vpc\_security\_group\_ids | n/a |
