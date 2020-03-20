### Creating ELB
resource "aws_elb" "lb" {
  name                        = var.name
  name_prefix                 = var.name_prefix

  subnets                     = var.subnet_id
  security_groups             = var.aws_lb_security_group_id
  internal                    = var.internal

  # availability_zones        = var.aws_lb_availability_zones
  cross_zone_load_balancing   = var.cross_zone_load_balancing

  listener                    = var.listener
  health_check                = var.health_check

  # health_check {
  #   healthy_threshold   = 2
  #   unhealthy_threshold = 2
  #   timeout             = 3
  #   interval            = 30
  #   target              = "HTTP:8080/"
  # }

  # listener {
  #   lb_port             = 80
  #   lb_protocol         = "http"
  #   instance_port       = "8080"
  #   instance_protocol   = "http"
  # }

}