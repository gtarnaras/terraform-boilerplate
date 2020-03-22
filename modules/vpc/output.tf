output "vpc_id" {
  description = "The vpc id"
  value = "${aws_vpc.this.id}"
}

output "subnet_id" {
  description = "The subnet id"
  value = "${aws_subnet.this.id}"
}

output "cidr_block" {
  description = "The cidr block id"
  value = "${aws_vpc.this.cidr_block}"
}