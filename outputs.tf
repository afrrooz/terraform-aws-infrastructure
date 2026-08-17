# outputs.tf

# VPC outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# Public subnet output
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

# Private subnet output
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}
# IAM outputs
output "iam_role_name" {
  description = "IAM role name"
  value       = module.iam.role_name
}

# EC2 outputs
output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

# EC2 public IP output
output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = module.ec2.public_ip
}

# Security group output
output "security_group_id" {
  description = "EC2 security group ID"
  value       = module.ec2.security_group_id
}

# S3 outputs
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = module.s3.bucket_arn
}

# ECR outputs
output "ecr_repository_urls" {
  description = "ECR repository URLs"
  value       = module.ecr.repository_urls
}

# RDS outputs
output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.db_endpoint
}

output "rds_address" {
  description = "RDS PostgreSQL hostname"
  value       = module.rds.db_address
}

output "rds_port" {
  description = "RDS PostgreSQL port"
  value       = module.rds.db_port
}