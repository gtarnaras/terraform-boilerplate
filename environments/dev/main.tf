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
  ingress_ports             = ["80", "423"]
  protocol                  = "TCP"
}

module "lb_setup" {
  source                     = "../../modules/elb"
  subnet_id                  = ["${module.vpc_setup.subnet_id}"]
  aws_lb_security_group_id   = ["${module.sg_rule_setup.vpc_security_group_ids}"]
  listener                   = [{lb_port = 80, lb_protocol = "http", instance_port = "8080", instance_protocol = "http"}]
  health_check               = [{healthy_threshold = 2, unhealthy_threshold = 2, timeout = 3 ,interval = 30, target = "HTTP:80/"}]
}

module "asg_setup" {
  source                    = "../../modules/autoscaling"
  env                       = "dev"
  load_balancers            = ["${module.lb_setup.aws_elb_name}"]
  min_size                  = 1
  max_size                  = 1
  desired_capacity          = 1
  health_check_type         = "EC2"
  vpc_zone_identifier       = ["${module.vpc_setup.subnet_id}"]
  vpc_security_group_ids    = ["${module.sg_rule_setup.vpc_security_group_ids}"]
}