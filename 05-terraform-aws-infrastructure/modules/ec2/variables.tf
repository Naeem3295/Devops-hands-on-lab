variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "private_subnet_a_id" {
  type = string
}

variable "private_subnet_b_id" {
  type = string
}

variable "app_security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}