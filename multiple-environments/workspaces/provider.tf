terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

 backend "s3" {
    bucket = "expense-proj-workspaces"
    key    = "expense-proj-infra"
    region = "us-east-1"
    dynamodb_table="expense-proj-workspaces-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}