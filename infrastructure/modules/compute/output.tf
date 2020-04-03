output "ec2_instance_id" {
  description = "List of ec2 instances IDs"
  value       = "${aws_instance.this.id}"
}