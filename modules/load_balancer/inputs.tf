variable "project_name" {
  description = "The name of the project to tag resources with."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., 'dev', 'prod')."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to create the load balancer in."
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of public subnet IDs for the load balancer."
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of security group IDs for the load balancer."
  type        = list(string)
}

variable "listener_port" {
  description = "The port for the load balancer listener."
  type        = number
  default     = 80
}

variable "target_group_port" {
  description = "The port for the target group (where instances listen)."
  type        = number
  default     = 80
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}