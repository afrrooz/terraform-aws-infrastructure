# terraform.tfvars

# AWS provider configuration
aws_region = "ap-south-1"

# VPC module variables
vpc_cidr = "10.0.0.0/16"

vpc_name = "devops-vpc"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

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

# EC2 key pair name
key_name = "devops-key"