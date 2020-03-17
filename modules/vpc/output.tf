output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet_id" {
  value = "${aws_subnet.subnet.id}"
}

output "cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}