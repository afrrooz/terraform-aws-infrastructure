# terraform.tfvars

# AWS provider configuration
aws_region = "ap-south-1"

# VPC module variables
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "ap-south-1a"
vpc_name           = "devops-vpc"

# IAM module variables
iam_role_name = "devops-ec2-role"

# EC2 module variables
instance_type = "t3.micro"
instance_name = "devops-ec2"

# Security group variable
ssh_cidr = "49.43.234.50/32"

# S3 module variables
bucket_name = "afrrooz-terraform-devops-2026"
environment = "dev"