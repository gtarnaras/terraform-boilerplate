module "vpc_setup" {
  source                  = "../../modules/vpc"
  env                     = "dev"
  subnet                  = "10.0.0.0/24"
  cidr_block              = "10.0.0.0/16"
}

module "sg_rule" {
  source                  = "../../modules/security_group"
  env                     = "dev"
  sg_name                 = "Default rule"
  vpc_id                  = "${module.vpc_setup.vpc_id}"
  cidr_block              = "${module.vpc_setup.cidr_block}"
  in_port_low             = "0"
  in_port_high            = "65535"
  out_port_low            = "0"
  out_port_high           = "65535"
  sg_protocol             = "-1"
}

module "instance_setup" {
  source                  = "../../modules/compute"
  env                     = "dev"
  vpc_security_group_ids  = ["${module.sg_rule.vpc_security_group_ids}"]
  subnet_id               = "${module.vpc_setup.subnet_id}"
}
