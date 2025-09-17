variable "region" {
  description = "AWS region for the project."
  type        = string
  default     = "us-east-1"
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
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "mic-prod-vpc"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet."
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  description = "Availability Zone for the private subnet."
  type        = string
  default     = "us-east-1b"
}