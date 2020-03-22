## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cidr\_block | The cidr block id | `string` | `"10.0.0.0/16"` | no |
| env | The environment name | `string` | `"test"` | no |
| map\_public\_ip\_on\_launch | Map public ip on launch | `bool` | `"true"` | no |
| subnet | The vpc id | `string` | `"10.0.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cidr\_block | The cidr block id |
| subnet\_id | The subnet id |
| vpc\_id | The vpc id |
