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

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  vpc_name           = var.vpc_name
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
  subnet_id             = module.vpc.public_subnet_id
  vpc_id                = module.vpc.vpc_id
  instance_profile_name = module.iam.instance_profile_name
  instance_name         = var.instance_name
  ssh_cidr              = var.ssh_cidr
}

#calling s3 module
module "s3" {
  source = "git::https://github.com/afrrooz/terraform-aws-s3.git"

  bucket_name = var.bucket_name
  environment = var.environment
}