terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

   backend "s3" {
    bucket = "remote-state-demo-bucket"  # name of s3 bucket
    key    = "remote-state-demo-bucket-key"  
    # this should be unique (this is the name of lock files created in dynamodb table )
    dynamodb_table = "remote-state-demo-bucket-locking" # name of table in dynamo db.
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}