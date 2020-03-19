module "vpc_setup" {
  source                    = "../../modules/vpc"
  env                       = "dev"
  subnet                    = "10.0.0.0/24"
  cidr_block                = "10.0.0.0/16"
}

module "sg_rule_setup" {
  source                    = "../../modules/security_group"
  env                       = "dev"
  sg_name                   = "Default rule"
  vpc_id                    = "${module.vpc_setup.vpc_id}"
  cidr_block                = "${module.vpc_setup.cidr_block}"
  in_port_low               = "0"
  in_port_high              = "65535"
  out_port_low              = "0"
  out_port_high             = "65535"
  sg_protocol               = "TCP"
}

# module "instance_setup" {
#   source                  = "../../modules/compute"
#   env                     = "dev"
#   vpc_security_group_ids  = ["${module.sg_rule_setup.vpc_security_group_ids}"]
#   subnet_id               = "${module.vpc_setup.subnet_id}"
# }

module "lb_setup" {
  source                     = "../../modules/elb"
  aws_lb_security_group_id   = ["${module.sg_rule_setup.vpc_security_group_ids}"]
  aws_lb_availability_zones  = ["us-east-1a"]
  subnet_id                  = ["${module.vpc_setup.subnet_id}"]
}

module "asg_setup" {
  source                    = "../../modules/autoscaling"
  env                       = "dev"
  aws_lb                    = "${module.lb_setup.aws_elb_name}"
  health_check_type         = "EC2"
  subnet_id                 = "${module.vpc_setup.subnet_id}"
}