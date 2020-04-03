variable "ami" {
  description = "The AMI id"
  default     = "ami-0fc61db8544a617ed"
}

variable "instance_type" {
  description = "The instance type "
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = list(string)
  default     = []
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list
}

variable "associate_public_ip_address" {
  description = "Attach a public ip address to the instance"
  type        = bool
  default     = false
}

variable "env" {
  description = "The name to be used to tag the resources"
  default     = "test"
}