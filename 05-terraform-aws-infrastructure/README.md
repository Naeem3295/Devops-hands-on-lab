# AWS Three-Tier Infrastructure with Terraform

## Project Overview

This project demonstrates a production-style AWS Three-Tier Infrastructure built entirely with Terraform using reusable modules. The infrastructure is designed following Infrastructure as Code (IaC) best practices and includes secure networking, high availability, load balancing, auto scaling, and bastion host access.

---

## Technologies Used

- Terraform
- AWS VPC
- EC2
- Ubuntu 24.04 LTS
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- NAT Gateway
- Internet Gateway
- Route Tables
- Security Groups
- Bastion Host

---

## Project Architecture

```
                        Internet
                            │
                     Internet Gateway
                            │
                 ┌──────────┴──────────┐
                 │                     │
          Public Subnet A       Public Subnet B
                 │                     │
          Bastion Host             Application Load Balancer
                                         │
                           ┌─────────────┴─────────────┐
                           │                           │
                  Private App Subnet A       Private App Subnet B
                           │                           │
                    Auto Scaling Group (EC2 Instances)
                           │
                      NAT Gateway (Outbound Internet)
```

---

# Infrastructure Components

### Networking

- Custom VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Public Route Table
- Private Route Table

---

### Security

- ALB Security Group
- Application Security Group
- Bastion Security Group
- Secure VPC Networking

---

### Compute

- Launch Template
- Auto Scaling Group
- Ubuntu 24.04 EC2 Instances

---

### Load Balancing

- Application Load Balancer
- Target Group
- HTTP Listener

---

### Bastion Host

A Bastion Host is deployed in the Public Subnet to securely manage EC2 instances running inside Private Subnets.

---

## Terraform Module Structure

```
modules/

├── alb/
├── bastion/
├── ec2/
├── internet-gateway/
├── nat-gateway/
├── rds/
├── route-tables/
├── security-groups/
├── subnets/
└── vpc/
```

---

## Project Structure

```
aws-three-tier-infrastructure-terraform/

├── modules/
├── screenshots/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── .gitignore
```

---

## Terraform Commands

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Deploy Infrastructure

```bash
terraform apply
```

Destroy Infrastructure

```bash
terraform destroy
