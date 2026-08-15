# Main Terraform configuration

#Data block for Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
#calling vpc module
module "vpc" {
  source = "git::https://github.com/afrrooz/terraform-aws-vpc.git"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}
#calling eks module
module "eks" {
  source = "git::https://github.com/afrrooz/terraform-aws-eks.git"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  node_instance_type = var.node_instance_type
  desired_size       = var.desired_size
  min_size           = var.min_size
  max_size           = var.max_size
}
#calling iam module
module "iam" {
  source = "git::https://github.com/afrrooz/terraform-aws-iam.git"

  role_name = var.iam_role_name
}
#calling ec2 module
module "ec2" {
  source = "git::https://github.com/afrrooz/terraform-aws-ec2.git"

  ami_id                = data.aws_ami.ubuntu.id
  instance_type         = var.instance_type
  subnet_id             = module.vpc.public_subnet_ids[0]
  vpc_id                = module.vpc.vpc_id
  instance_profile_name = module.iam.instance_profile_name
  instance_name         = var.instance_name
  ssh_cidr              = var.ssh_cidr
  key_name              = var.key_name
}

#calling s3 module
module "s3" {
  source = "git::https://github.com/afrrooz/terraform-aws-s3.git"

  bucket_name = var.bucket_name
  environment = var.environment
}

#calling ecr module
module "ecr" {
  source = "git::https://github.com/afrrooz/terraform-aws-ecr.git"

  repository_names = [
    "egarrage-frontend",
    "egarrage-backend"
  ]
}