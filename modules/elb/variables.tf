variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "The prefix name of the ELB"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = list(string)
}

variable "aws_lb_security_group_id" {
  description = "A list of security group IDs to assign to the ELB"
  type        = list(string)
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
  type        = bool
  default     = false
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  type        = bool
  default     = true
}

variable "listener" {
  description = "A list of listener blocks"
  type        = list(map(string))
}

variable "health_check" {
  description = "A health check block"
  type        = map(string)
}