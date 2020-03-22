variable "name_prefix" {
  description = "The prefix name of the Launch Template"
  type        = string
  default     = "dev"
}

variable "image_id" {
  description = "The name of the AMI ID"
  default     = "ami-0fc61db8544a617ed"
}

variable "instance_type" {
  description = "The size of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to assign to the Launch Template"
  type        = list(string)
}

# variable "create_before_destroy" {
#   description = "If true, Terraform will instead destroy the existing object and then create a new one"
#   type        = bool
#   default     = true
# }

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = string
  default     = "180"
}

variable "force_delete" {
  description = "If true, Terraform allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
  type        = bool
  default     = false
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  type        = string
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  type        = string
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  type        = string
}

variable "load_balancers" {
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  type        = list(string)
  default     = []
}

variable "timeouts" {
  description = "Used for destroying ASG"
  type        = string
  default     = "15m"
}

variable "wait_for_capacity_timeout" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
  type        = string
  default     = "10m"
}

variable "health_check_type" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
  type        = string
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "env" {
  description = "Current environment name"
  default     = "test"
}

variable "launch_template_version" {
  description = "Launch template version"
  type        = string
  default     = "$Latest"
}