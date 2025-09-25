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


module "ec2" {
  source = "./modules/ec2"

  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  subnets          = [
    module.vpc.public_subnet1_id,
    module.vpc.public_subnet2_id,
 
  ]
  security_group_ids = []
  tags = {
    Name = var.ec2_linux_name
  }
}



module "security_group" {
  source = "./modules/security_group"
  
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = var.sg_name
  }
}