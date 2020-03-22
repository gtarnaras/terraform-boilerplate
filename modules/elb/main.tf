resource "aws_elb" "this" {
  name        = var.name
  name_prefix = var.name_prefix

  subnets         = var.subnets
  security_groups = var.aws_lb_security_group_id
  internal        = var.internal

  cross_zone_load_balancing = var.cross_zone_load_balancing

  dynamic "listener" {
    for_each = var.listener
    content {
      instance_port     = listener.value.instance_port
      instance_protocol = listener.value.instance_protocol
      lb_port           = listener.value.lb_port
      lb_protocol       = listener.value.lb_protocol
      # ssl_certificate_id = lookup(listener.value, "ssl_certificate_id", null)
    }
  }

  dynamic "health_check" {
    for_each = var.health_check
    content {
      healthy_threshold   = health_check.value.healthy_threshold
      unhealthy_threshold = health_check.value.unhealthy_threshold
      target              = health_check.value.target
      interval            = health_check.value.interval
      timeout             = health_check.value.timeout
    }
  }

}