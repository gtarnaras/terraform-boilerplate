resource "aws_instance" "this" {

  instance_count = var.number_of_instances

  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids # list
  associate_public_ip_address = true

  tags = {
    Name = "${var.env}_instance"
    Env  = var.env
  }
}