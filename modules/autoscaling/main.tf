resource "aws_launch_template" "launch_template_cfg" {
  name_prefix              = "launch_template_cfg"
  image_id                 = var.ami_id
  instance_type            = var.instance_type

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "worker" {

  name                     = "worker-asg"
  availability_zones       = ["us-east-1a"]
  desired_capacity         = 1
  max_size                 = 1
  min_size                 = 1
  load_balancers           = [var.aws_lb]
  health_check_type        = var.health_check_type
  vpc_zone_identifier      = [var.subnet_id]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.launch_template_cfg.id
        version            = "$Latest"
      }

    #   override {
    #     instance_type     = "t3.micro"
    #     weighted_capacity = "3"
    #   }

    #   override {
    #     instance_type     = "t3.micro"
    #     weighted_capacity = "2"
    #   }
    }
  }

  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }

}
