terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
      bucket = "yuv-tf-backend"
      key = "taskit-infra/terraform.state"
      region = "eu-central-1"
	}
}

provider "aws" {
  profile = var.profile
  region  = var.region

  default_tags {
    tags = {
      owner = var.owner_tag
      bootcamp = var.bootcamp_tag
      expiration_date = var.expiration_date_tag
    }
  }
}