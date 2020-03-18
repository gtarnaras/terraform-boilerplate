variable "ami_id" {
  default = "ami-0fc61db8544a617ed"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_lb" {}

variable "health_check_type" {}

variable "subnet_id" {}

variable "env" {
  default = "test"
}