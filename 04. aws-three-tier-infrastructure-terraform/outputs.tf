output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}
output "public_subnet_a" {
  value = module.subnets.public_subnet_a_id
}

output "public_subnet_b" {
  value = module.subnets.public_subnet_b_id
}

output "private_app_subnet_a" {
  value = module.subnets.private_app_subnet_a_id
}

output "private_app_subnet_b" {
  value = module.subnets.private_app_subnet_b_id
}
output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}
output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "elastic_ip_allocation_id" {
  value = module.nat_gateway.elastic_ip_allocation_id
}
output "public_route_table_id" {
  value = module.route_tables.public_route_table_id
}

output "private_route_table_id" {
  value = module.route_tables.private_route_table_id
}
output "alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}

output "app_security_group_id" {
  value = module.security_groups.app_security_group_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}
output "launch_template_id" {
  value = module.ec2.launch_template_id
}

output "autoscaling_group_name" {
  value = module.ec2.autoscaling_group_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "bastion_security_group_id" {
  value = module.bastion.bastion_security_group_id
}