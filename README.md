# eGarage - AWS Infrastructure with Terraform

Terraform configuration for provisioning the AWS infrastructure used by the **eGarage Cloud-Native DevOps Platform**.

## Overview

This repository contains the **Infrastructure as Code (IaC)** configuration used to provision and manage the AWS environment for the eGarage application.

The infrastructure supports the application's containerized deployment, Amazon EKS Kubernetes cluster, Amazon ECR container registry, and Amazon RDS PostgreSQL database.

## AWS Services

The infrastructure includes resources for:

- Amazon VPC
- Subnets and Route Tables
- Internet Gateway
- NAT Gateway
- Security Groups
- IAM Roles and Policies
- Amazon EKS
- EKS Managed Node Group
- Amazon ECR
- Amazon RDS PostgreSQL
- Amazon CloudWatch

## Project Architecture

```text
                         AWS Cloud
                             |
                            VPC
                             |
              +--------------+--------------+
              |                             |
        Public Subnets                Private Subnets
              |                             |
       Internet Gateway               EKS Cluster
              |                             |
        NAT Gateway              Managed Node Group
                                            |
                                      Kubernetes Pods
                                      /            \
                               Frontend          Backend
                                                    |
                                             RDS PostgreSQL

Repository Structure
terraform-aws-infrastructure/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── terraform.tfvars
├── .gitignore
├── .terraform.lock.hcl
└── README.md
Terraform Workflow
Initialize Terraform
terraform init
Validate the configuration
terraform validate
Review infrastructure changes
terraform plan
Provision the infrastructure
terraform apply
Review the destruction plan
terraform plan -destroy
Destroy the infrastructure
terraform destroy
Infrastructure as Code

Terraform was used to automate the creation and management of the AWS infrastructure instead of configuring each resource manually.

The configuration covers:

AWS networking
IAM access
Container infrastructure
Kubernetes infrastructure
Database infrastructure
Supporting AWS services

This approach makes the infrastructure reproducible and easier to manage through version control.

CI/CD Integration

The repository also contains a GitHub Actions workflow:

.github/workflows/terraform.yml

The workflow integrates Terraform operations with GitHub Actions as part of the project's DevOps workflow.

DevOps Technologies
Terraform
AWS
Amazon VPC
Amazon EKS
Kubernetes
Amazon ECR
Amazon RDS PostgreSQL
IAM
Docker
GitHub Actions
Linux
Project

eGarage - Cloud-Native DevOps Platform

This Terraform repository represents the Infrastructure as Code layer of the project.

It works together with the application's Docker images, CI/CD pipeline, Kubernetes manifests, Amazon ECR repositories, Amazon EKS cluster, and Amazon RDS PostgreSQL database.

Key DevOps Practices
Infrastructure as Code using Terraform
Version-controlled infrastructure
Automated AWS resource provisioning
IAM-based access control
Containerized application deployment
Kubernetes orchestration using Amazon EKS
Managed PostgreSQL database using Amazon RDS
Container image management using Amazon ECR
CI/CD automation using GitHub Actions
Infrastructure cleanup using Terraform
Author

Mohammed Afroz

Cloud & DevOps Project
