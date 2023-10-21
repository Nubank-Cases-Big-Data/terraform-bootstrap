terraform {
  required_version = ">= 1.5.7"

  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.19.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Terraform   = "true"
      Project     = "terraform-bootstrap"
      Name        = "terraform-bootstrap"
      Owner       = "piper.alright"
      Environment = "${var.environment}"
    }
  }
}
