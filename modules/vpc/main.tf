resource "aws_vpc" "this" {
  cidr_block              = var.cidr_block

  tags                    = {
                              Name = "${var.env}_vpc"
                              Env  = var.env
                            }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags                    = {
                              Name = "${var.env}_subnet"
                              Env  = var.env
                            }
}

resource "aws_internet_gateway" "this" {
  vpc_id                  = aws_vpc.this.id

  tags                    = {
                              Name = "${var.env}_gw"
                              Env  = var.env
                            }
}

# resource "aws_default_route_table" "route_table" {
#   default_route_table_id  = aws_vpc.vpc.default_route_table_id
#   route {
#     cidr_block            = var.cidr_block
#     gateway_id            = aws_internet_gateway.gw.id
#   }

#   tags                    = {
#                               Name = "${var.env}_route_table"
#                               Env  = var.env
#                             }
# }