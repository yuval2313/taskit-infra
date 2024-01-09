# Task-it Terraform IaC - EKS on AWS

This repository contains Terraform Infrastructure as Code (IaC) for deploying an Amazon EKS (Elastic Kubernetes Service) cluster on AWS.  
The infrastructure is designed to support the deployment of the Task-it application using Kubernetes.

## Prerequisites

Ensure you have the following prerequisites before getting started:

- [Terraform](https://www.terraform.io/) installed
- AWS account and appropriate credentials configured
- AWS CLI installed for authentication and configuration

## Terraform Modules

- **`network/`** - Creates the VPC for the cluster.
- **`security/`** - Creates the necessary IAM roles for the cluster.
- **`eks/`** - Deploys the EKS cluster, a node group, and required add-ons.
- **`main.tf`** - Main module.

## Configuration

1. Set an S3 bucket as the backend in `providers.tf`:

```json
terraform {
  required_providers {
    aws = { ... }
  }

  backend "s3" {
      bucket = "your-bucket"
      key = "some-key-for-state-file"
      region = "your-bucket-region"
  }
}

provider "aws" { ... }
```

2. Configure the project using your own `terraform.tfvars`:

```sh
owner_tag = "your.name"
bootcamp_tag = <number-over-19>
expiration_date_tag = "01-01-2099"

# main.tf
name_prefix = "custom-prefix"
instance_type = "node-group-instance-type"
```

## Deployment

1. Initialize Terraform:

```sh
terraform init
```

2. Deploy Terraform:

```sh
terraform apply
```
