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


variable "public_subnet_cidr_block" {
    description = "this is the public subnet cidr block"
    type        = string
}

variable "private_subnet_cidr_block" {
    description = "this is the public subnet cidr block"
    type        = string
}

variable "region" {
    description = "region name"
    type        = string
}

variable "public_subnet_az" {
    description = "availability zones"
    type        = string
}

variable "private_subnet_az" {
    description = "availability zones"
    type        = string
}


