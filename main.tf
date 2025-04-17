module "vpc" {
  source          = "./modules/vpc"
  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  pub_sub_1a_cidr = var.pub_sub_1a_cidr
  pub_sub_2b_cidr = var.pub_sub_2b_cidr
  pri_sub_3a_cidr = var.pri_sub_3a_cidr
  pri_sub_4b_cidr = var.pri_sub_4b_cidr
  pri_sub_5a_cidr = var.pri_sub_5a_cidr
  pri_sub_6b_cidr = var.pri_sub_6b_cidr
}   

module "NAT" {
  source = "./modules/NAT"
  pub_sub_1a_id = module.vpc.public_subnet_1a_id
  igw_id = module.vpc.igw_id
  pub_sub_2b_id = module.vpc.public_subnet_2b_id
  aws_vpc_id = module.vpc.aws_vpc_id
  private_sub_3a_id = module.vpc.private_sub_3a_id
  private_sub_4b_id = module.vpc.private_sub_4b_id
  private_sub_5a_id = module.vpc.private_sub_5a_id
  private_sub_6b_id = module.vpc.private_sub_6b_id
}

module "aws_security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.aws_vpc_id

}

module "alb" {
  source = "./modules/alb"
  project_name  = var.project_name
  aws_alb = module.alb.aws_alb
  pub_sub_1a_id = module.vpc.public_subnet_1a_id
  pub_sub_2b_id = module.vpc.public_subnet_2b_id

}
