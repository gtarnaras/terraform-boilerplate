resource "aws_launch_template" "this" {
  name_prefix                 = var.name_prefix
  image_id                    = var.image_id
  instance_type               = var.instance_type

  vpc_security_group_ids      = var.vpc_security_group_ids

  lifecycle {
    create_before_destroy     = true
  }
}

# resource "aws_placement_group" "test" {
#   name                        = "test"
#   strategy                    = "cluster"
# }

resource "aws_autoscaling_group" "this" {

  name                        = "${var.name_prefix}-asg"

  desired_capacity            = var.desired_capacity
  max_size                    = var.max_size
  min_size                    = var.min_size
  # placement_group             = "${aws_placement_group.test.id}"

  load_balancers              = var.load_balancers
  health_check_type           = var.health_check_type
  health_check_grace_period   = var.health_check_grace_period

  vpc_zone_identifier         = var.vpc_zone_identifier
  force_delete                = var.force_delete
  wait_for_capacity_timeout   = var.wait_for_capacity_timeout

  lifecycle {
    create_before_destroy     = true
  }

  timeouts {
    delete                    = var.timeouts
  }

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id    = aws_launch_template.this.id
        version               = var.launch_template_version
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
    key                       = "Name"
    value                     = "terraform-asg-example"
    propagate_at_launch       = true
  }

}
