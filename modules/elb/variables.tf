variable "aws_lb_security_group_id" {}

variable "subnet_id" {
    description = "List of subnets"
    type        = list
}

variable "aws_lb_availability_zones" {
    description = "List of AZs"
    type        = list
}