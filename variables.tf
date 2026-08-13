# variables.tf

# AWS provider variable
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}


variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}