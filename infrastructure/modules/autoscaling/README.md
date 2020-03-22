## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| desired\_capacity | The number of Amazon EC2 instances that should be running in the group | `string` | n/a | yes |
| env | Current environment name | `string` | `"test"` | no |
| force\_delete | If true, Terraform allows deleting the autoscaling group without waiting for all instances in the pool to terminate | `bool` | `false` | no |
| health\_check\_grace\_period | Time (in seconds) after instance comes into service before checking health | `string` | `"180"` | no |
| health\_check\_type | Controls how health checking is done. Values are - EC2 and ELB | `string` | n/a | yes |
| image\_id | The name of the AMI ID | `string` | `"ami-0fc61db8544a617ed"` | no |
| instance\_type | The size of instance to launch | `string` | `"t2.micro"` | no |
| launch\_template\_version | Launch template version | `string` | `"$Latest"` | no |
| load\_balancers | A list of elastic load balancer names to add to the autoscaling group names | `list(string)` | `[]` | no |
| max\_size | The maximum size of the auto scale group | `string` | n/a | yes |
| min\_size | The minimum size of the auto scale group | `string` | n/a | yes |
| name\_prefix | The prefix name of the Launch Template | `string` | `"dev"` | no |
| timeouts | Used for destroying ASG | `string` | `"15m"` | no |
| vpc\_security\_group\_ids | A list of security group IDs to assign to the Launch Template | `list(string)` | n/a | yes |
| vpc\_zone\_identifier | A list of subnet IDs to launch resources in | `list(string)` | n/a | yes |
| wait\_for\_capacity\_timeout | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior. | `string` | `"10m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| asg\_id | The autoscaling group id |
| launch\_template\_id | The ID of the launch template |
