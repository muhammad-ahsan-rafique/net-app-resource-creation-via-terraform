variable "project_name" {
    description = "project name"
    type        = string
}

variable "env" {
    description = "environment name such as prod, dev"
    type        = string
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
    type        = string
}

variable "vpc_name" {
    description = "name of the vpc"
    type        = string
}


variable "public_subnet1_cidr_block" {
    description = "CIDR block for the first public subnet"
    type        = string
}

variable "public_subnet2_cidr_block" {
    description = "CIDR block for the second public subnet"
    type        = string
}

variable "private_subnet1_cidr_block" {
    description = "CIDR block for the first private subnet"
    type        = string
}

variable "private_subnet2_cidr_block" {
    description = "CIDR block for the second private subnet"
    type        = string
}

variable "region" {
    description = "region name"
    type        = string
}

variable "public_subnet1_az" {
    description = "availability zone for first public subnet"
    type        = string
}

variable "public_subnet2_az" {
    description = "availability zone for second public subnet"
    type        = string
}

variable "private_subnet1_az" {
    description = "availability zone for first private subnet"
    type        = string
}

variable "private_subnet2_az" {
    description = "availability zone for second private subnet"
    type        = string
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Use single NAT Gateway for all private subnets"
  type        = bool
}

variable "nat_eip_tags" {
  description = "Additional tags for NAT Gateway EIPs"
  type        = map(string)
}

variable "nat_gateway_tags" {
  description = "Additional tags for NAT Gateways"
  type        = map(string)
}


