terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  profile = "bruno_terraform"
}

resource "aws_s3_bucket" "bucket_s3" {
  bucket = "cursotfbruno2024"

  tags = {
    CreatedAt = "2024-11-03"
    ManagedBy = "Terraform"
  }
  
}

resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.bucket_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}