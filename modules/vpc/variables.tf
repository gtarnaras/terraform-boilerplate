variable "cidr_block" {
  description = "The cidr block id"
  default     = "10.0.0.0/16"
}

variable "subnet" {
  description = "The vpc id"
  default     = "10.0.0.0/24"
}

variable "map_public_ip_on_launch" {
  description = "Map public ip on launch"
  type        = bool
  default     = "true"
}

variable "env" {
  description = "The environment name"
  default     = "test"
}