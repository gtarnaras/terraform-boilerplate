output "asg_id" {
  description = "The autoscaling group id"
  value = "${aws_autoscaling_group.this.id}"
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value = "${aws_launch_template.this.id}"
}