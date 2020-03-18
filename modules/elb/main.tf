### Creating ELB
resource "aws_elb" "lb" {
  name                  = "terraform-asg-example"
  security_groups       = var.aws_lb_security_group_id
  availability_zones    = var.aws_lb_availability_zones
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/"
  }
  listener {
    lb_port             = 80
    lb_protocol         = "http"
    instance_port       = "8080"
    instance_protocol   = "http"
  }
}