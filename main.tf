terraform {
  required_version = ">= 1.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "zeya-state-bucket"
    key    = "zeya-state-key.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  #checkov:skip=CKV2_AWS_62: Ensure S3 buckets should have event notifications enabled
  #checkov:skip=CKV_AWS_21: Ensure all data stored in the S3 bucket have versioning enabled
  #checkov:skip=CKV2_AWS_6: Ensure that S3 bucket has a Public Access block
  #checkov:skip=CKV_AWS_145: Ensure that S3 buckets are encrypted with KMS by default
  #checkov:skip=CKV_AWS_18: Ensure the S3 bucket has access logging enabled
  #checkov:skip=CKV_AWS_144: Ensure that S3 bucket has cross-region replication enabled
  #checkov:skip=CKV2_AWS_61: Ensure that an S3 bucket has a lifecycle configuration
  bucket_prefix = "zeya-state-bucket"
}