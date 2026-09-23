terraform {
  backend "s3" {
    bucket       = "zeya-state-bucket"
    key          = "zeya-state-key.tfstate"
    region       = "us-east-1"
  }
}

provider "aws" {
   region = "us-east-1"
}

resource "aws_s3_bucket" "workshop" {
  bucket_prefix = "zeya-state-bucket"
}