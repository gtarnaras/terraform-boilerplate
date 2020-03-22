resource "aws_elb" "this" {
  name                        = var.name
  name_prefix                 = var.name_prefix

  subnets                     = var.subnet_id
  security_groups             = var.aws_lb_security_group_id
  internal                    = var.internal

  cross_zone_load_balancing   = var.cross_zone_load_balancing

  dynamic "listener" {
    for_each = var.listener
    content {
      instance_port      = listener.value.instance_port
      instance_protocol  = listener.value.instance_protocol
      lb_port            = listener.value.lb_port
      lb_protocol        = listener.value.lb_protocol
      # ssl_certificate_id = lookup(listener.value, "ssl_certificate_id", null)
    }
  }

  health_check {
    healthy_threshold   = lookup(var.health_check, "healthy_threshold")
    unhealthy_threshold = lookup(var.health_check, "unhealthy_threshold")
    target              = lookup(var.health_check, "target")
    interval            = lookup(var.health_check, "interval")
    timeout             = lookup(var.health_check, "timeout")
  }

}