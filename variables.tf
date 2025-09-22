variable "region" {
  description = "AWS region for the project."
  type        = string
  default     = "us-east-2"
}

variable "profile" {
  description = "set the name of the profile when we have multiple accounts configured"
  type        = string
  default     = "ic"
}

variable "project_name" {
  description = "Project name for resource tagging."
  type        = string
  default     = "mic"
}

variable "env" {
  description = "Environment name (e.g., prod, dev, stage)."
  type        = string
  default     = "prod"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "mic-prod-vpc"
}

variable "public_subnet1_cidr_block" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.10.0.0/20"
}

variable "public_subnet2_cidr_block" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.10.16.0/20"
}

variable "private_subnet1_cidr_block" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "10.10.128.0/20"
}

variable "private_subnet2_cidr_block" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.10.144.0/20"
}

variable "public_subnet1_az" {
  description = "Availability Zone for the public subnet."
  type        = string
  default     = "us-east-2a"
}

variable "public_subnet2_az" {
  description = "Availability Zone for the second public subnet"
  type        = string
  default     = "us-east-2b"
}

variable "private_subnet1_az" {
  description = "Availability Zone for the first private subnet"
  type        = string
  default     = "us-east-2a"
}

variable "private_subnet2_az" {
  description = "Availability Zone for the second private subnet"
  type        = string
  default     = "us-east-2b"
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use single NAT Gateway for all private subnets"
  type        = bool
  default     = false
}

variable "nat_eip_tags" {
  description = "Additional tags for NAT Gateway EIPs"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_tags" {
  description = "Additional tags for NAT Gateways"
  type        = map(string)
  default     = {}
}