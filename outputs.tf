output "aws_vpc_id" {
    value = module.vpc.aws_vpc_id
}

output "igw_id" {
    value = module.vpc.igw_id
}

output "public_subnet_1a_id" {
    value = module.vpc.public_subnet_1a_id
}

output "public_subnet_2b_id" {
    value = module.vpc.public_subnet_2b_id
}

output "route_table_id" {
    value = module.vpc.route_table_id
}

output "private_sub_3a_id" {
    value = module.vpc.private_sub_3a_id
}

output "private_sub_4b_id" {
    value = module.vpc.private_sub_4b_id
}

output "private_sub_5a_id" {
    value = module.vpc.private_sub_5a_id
}

output "private_sub_6b_id" {
    value = module.vpc.private_sub_6b_id
}

output "aws_eip" {
    value = module.NAT.aws_eip
}

output "application_load_balancer" {
    value = module.alb.aws_alb
}