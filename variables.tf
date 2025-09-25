variable "region" {
  description = "AWS region for the project."
  type        = string
  default     = "us-east-2"
}

variable "profile" {
  description = "set the name of the profile when we have multiple accounts configured"
  type        = string
  default     = "mic"
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

# EC2 Varaibles setup


variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = "ami-0b1dcb5abc47cd8b5" 
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  type        = string
  default     = "t2.micro" 
}

variable "key_name" {
  description = "The key pair name to use for the instances."
  type        = string
  default     = "mic-linux-test-kp"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = {
    Project = "mic-project"
    Env     = "prod"
    Owner   = "Moavia Hassan"
  }
}



variable "ec2_linux_name" {
  type        = string
  description = "Create a single NAT gateway."
  default     = "mic-prod-linux"
}


# for Security groups:

variable "vpc_id" {
  description = "The ID of the VPC to create the security group in."
  type        = string
}

variable "ssh_port" {
  description = "The port to allow SSH traffic on."
  type        = number
  default     = 22
}

variable "http_port" {
  description = "The port to allow HTTP traffic on."
  type        = number
  default     = 80
}

variable "source_cidr_block" {
  description = "The CIDR block to allow inbound traffic from."
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_name" {
  description = "sg_name"
  type        = string
  default     = "mic-prod-sg"
}


