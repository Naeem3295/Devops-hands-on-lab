variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}

variable "public_subnet_a_id" {
  description = "Public Subnet A ID"
  type        = string
}

variable "public_subnet_b_id" {
  description = "Public Subnet B ID"
  type        = string
}

variable "private_subnet_a_id" {
  description = "Private App Subnet A ID"
  type        = string
}

variable "private_subnet_b_id" {
  description = "Private App Subnet B ID"
  type        = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}