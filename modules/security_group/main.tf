resource "aws_security_group" "sg" {
  name            = var.sg_name
  description     = "Security group rule"
  vpc_id          = var.vpc_id

  dynamic "ingress" {
    iterator      = port
    for_each      = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol
      cidr_blocks = [
                      var.cidr_block
                    ]
    }
  }

  tags            = {
                      Name = "${var.env}:${var.sg_name}"
                      Env  = var.env
                    }
}