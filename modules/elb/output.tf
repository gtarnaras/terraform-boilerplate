output "aws_elb_name" {
  description = "The id of the ELB"
  value       = "${aws_elb.this.id}"
}
