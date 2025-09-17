module "vpc" {
    source                       = "./modules/vpc"

    project_name                 = var.project_name
    env                          = var.env
    region                       = var.region
    vpc_name                     = var.vpc_name
    vpc_cidr_block               = var.vpc_cidr_block
    public_subnet_cidr_block     = var.public_subnet_cidr_block
    private_subnet_cidr_block    = var.private_subnet_cidr_block
    public_subnet_az             = var.public_subnet_az
    private_subnet_az            = var.private_subnet_az
}