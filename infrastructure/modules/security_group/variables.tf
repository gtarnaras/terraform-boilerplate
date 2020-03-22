variable "sg_name" {
  description = "The security group name"
  default     = "sg_name"
}

variable "vpc_id" {
  description = "The vpc id"
}

variable "env" {
  description = "The environment name"
  default     = "test"
}

variable "ingress_ports" {
  description = "list of ingress ports"
  type        = list(number)
  default     = [80, 423]
}

variable "cidr_block" {
  description = "The cidr block address"
  default     = "10.0.0.0/16"
}

variable "protocol" {
  description = "The protocol type, could be TCP/UDP"
  default     = "-1"
}
