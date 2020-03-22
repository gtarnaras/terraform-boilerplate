output "vpc_security_group_ids" {
  value = "${aws_security_group.sg.id}"
}

output "sg_ports" {
  value = aws_security_group.sg.ingress[*].from_port
}