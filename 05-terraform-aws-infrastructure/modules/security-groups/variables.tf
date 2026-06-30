variable "vpc_id" {
  description = "VPC ID"
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
variable "bastion_security_group_id" {
  description = "Bastion Security Group ID"
  type        = string
}