variable "sg_name" {
  default = "sg_name"
}

variable "env" {
  default = "test"
}

variable "vpc_id" {}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "in_port_low" {
  default = "0"
}

variable "in_port_high" {
  default = "0" #65535 but let's keep things secure
}

variable "sg_protocol" {
  default = "-1"
}

variable "out_port_low" {
  default = "0"
}

variable "out_port_high" {
  default = "0" #65535 but let's keep things secure
}