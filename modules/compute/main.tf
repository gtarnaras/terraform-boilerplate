resource "aws_instance" "VM-in-new-vpc" {
  ami                    = var.ami_id
  instance_type          = var.instance_flavor
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids # list
}