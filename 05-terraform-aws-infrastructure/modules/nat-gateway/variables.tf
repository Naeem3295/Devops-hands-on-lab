variable "public_subnet_id" {
  description = "Public Subnet ID where the NAT Gateway will be deployed"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}