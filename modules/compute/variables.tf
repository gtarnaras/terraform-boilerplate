variable "ami_id" {
  default = "ami-0fc61db8544a617ed"
}

variable "instance_flavor" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list
}