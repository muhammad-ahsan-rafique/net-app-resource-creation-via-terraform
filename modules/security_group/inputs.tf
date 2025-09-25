variable "vpc_id" {
  description = "The ID of the VPC to create the security group in."
  type        = string
}

variable "sg_name" {
  description = "security group name"
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

variable "tags" {
  description = "A map of tags to assign to the security group."
  type        = map(string)
  default     = {}
}