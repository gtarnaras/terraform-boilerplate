module "example_vpc" {
  source     = "../../modules/vpc"
  env        = "us-east-1"
  subnet     = "10.0.0.0/24"
  cidr_block = "10.0.0.0/16"
}

module "example_sg" {
  source     = "../../modules/security_group"
  vpc_id = "${module.example_vpc.vpc_id}"
}

module "example_instance" {
  source     = "../../modules/compute"
  vpc_security_group_ids = ["${module.example_sg.vpc_security_group_ids}"]
  subnet_id = "${module.example_vpc.subnet_id}"

}
