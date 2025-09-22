module "vpc" {
  source = "./modules/vpc"

  project_name   = var.project_name
  env            = var.env
  region         = var.region
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block

  public_subnet1_cidr_block = var.public_subnet1_cidr_block
  public_subnet1_az         = var.public_subnet1_az

  public_subnet2_cidr_block = var.public_subnet2_cidr_block
  public_subnet2_az         = var.public_subnet2_az

  private_subnet1_cidr_block = var.private_subnet1_cidr_block
  private_subnet1_az         = var.private_subnet1_az

  private_subnet2_cidr_block = var.private_subnet2_cidr_block
  private_subnet2_az         = var.private_subnet2_az

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  nat_eip_tags       = var.nat_eip_tags
  nat_gateway_tags   = var.nat_gateway_tags
}