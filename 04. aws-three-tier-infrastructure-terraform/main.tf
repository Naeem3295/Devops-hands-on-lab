module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "internet_gateway" {
  source = "./modules/internet-gateway"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment
}

module "nat_gateway" {
  source = "./modules/nat-gateway"

  public_subnet_id = module.subnets.public_subnet_a_id

  project_name = var.project_name
  environment  = var.environment
}
module "route_tables" {
  source = "./modules/route-tables"

  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id

  public_subnet_a_id = module.subnets.public_subnet_a_id
  public_subnet_b_id = module.subnets.public_subnet_b_id

  private_subnet_a_id = module.subnets.private_app_subnet_a_id
  private_subnet_b_id = module.subnets.private_app_subnet_b_id

  project_name = var.project_name
  environment  = var.environment
}
module "alb" {
  source = "./modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_a_id = module.subnets.public_subnet_a_id
  public_subnet_b_id = module.subnets.public_subnet_b_id

  alb_security_group_id = module.security_groups.alb_security_group_id
}
module "security_groups" {
  source = "./modules/security-groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment

  bastion_security_group_id = module.bastion.bastion_security_group_id
}
module "ec2" {
  source = "./modules/ec2"

  project_name = var.project_name
  environment  = var.environment

  key_name      = var.key_name
  instance_type = var.instance_type

  private_subnet_a_id = module.subnets.private_app_subnet_a_id
  private_subnet_b_id = module.subnets.private_app_subnet_b_id

  app_security_group_id = module.security_groups.app_security_group_id

  target_group_arn = module.alb.target_group_arn
}
module "bastion" {
  source = "./modules/bastion"

  project_name = var.project_name
  environment  = var.environment

  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_a_id

  key_name = var.key_name
  my_ip    = var.my_ip
}
