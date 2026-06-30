variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_a_id" {
  description = "Public Subnet A"
  type        = string
}

variable "public_subnet_b_id" {
  description = "Public Subnet B"
  type        = string
}

variable "alb_security_group_id" {
  description = "ALB Security Group"
  type        = string
}
variable "health_check_path" {
  description = "Health Check Path"
  type        = string
  default     = "/"
}

variable "target_port" {
  description = "Target Group Port"
  type        = number
  default     = 80
}