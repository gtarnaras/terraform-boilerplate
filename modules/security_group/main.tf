resource "aws_security_group" "sg" {
  name          = var.sg_name
  description   = "Security group rule"
  vpc_id        = var.vpc_id

  ingress {
    cidr_blocks = [
                    var.cidr_block
                  ]
    from_port   = var.in_port_low
    to_port     = var.in_port_high
    protocol    = var.sg_protocol
  }

  egress {
    from_port   = var.out_port_low
    to_port     = var.out_port_high
    protocol    = var.sg_protocol
    cidr_blocks = [
                    var.cidr_block
                  ]
  }

  tags          = {
                    Name = "${var.env}:${var.sg_name}"
                    Env  = var.env
                  }
}