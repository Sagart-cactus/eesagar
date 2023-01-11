module "ee_test_vpc" {
  source = "./network"
  vpc_name = "${local.name}-${var.vpc_name}"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_availability_zones = var.vpc_availability_zones
  vpc_public_subnets  = var.vpc_public_subnets
  vpc_private_subnets = var.vpc_private_subnets  
  # NAT Gateways - Outbound Communication
  vpc_enable_nat_gateway = var.vpc_enable_nat_gateway 
  vpc_single_nat_gateway = var.vpc_single_nat_gateway
  tags = local.common_tags
}

module "ee_test_keypair" {
  source = "./keypair"
  count = var.create_key_pair ? 1 : 0
  keypair_name = local.name
}

module "ee_test_private_ec2" {
  source = "./ec2"
  name = "${local.name}-ec2-private"
  ami = var.ami_id
  instance_type = var.instance_type
  instance_keypair = local.ec2_keypair
  subnet_id = module.ee_test_vpc.private_subnets[0]
  user_data = var.user_data_file_ansible
  tags = local.common_tags
  vpc_id = module.ee_test_vpc.vpc_id
  allow_cidr = [module.ee_test_vpc.vpc_cidr_block]
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
}

module "ee_test_public_ec2" {
  source = "./ec2"
  name = "${local.name}-ec2-public"
  ami = var.ami_id
  instance_type = var.instance_type
  instance_keypair = local.ec2_keypair
  subnet_id = module.ee_test_vpc.public_subnets[0]
  user_data = var.user_data_file_jenkins_ansible
  tags = local.common_tags
  vpc_id = module.ee_test_vpc.vpc_id
  allow_cidr = [var.jenkins_allow_ip]
  ingress_rules = ["ssh-tcp", "http-8080-tcp"]
}