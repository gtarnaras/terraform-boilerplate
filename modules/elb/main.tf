resource "aws_elb" "lb" {
  name                        = var.name
  name_prefix                 = var.name_prefix

  subnets                     = var.subnet_id
  security_groups             = var.aws_lb_security_group_id
  internal                    = var.internal

  cross_zone_load_balancing   = var.cross_zone_load_balancing

  listener                    = var.listener
  health_check                = var.health_check
}