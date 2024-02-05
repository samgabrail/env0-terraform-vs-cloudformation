terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "demo_storage" {
  bucket = "env0-demo-terraform-storage"
  tags = {
    "built with" = "terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.demo_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.demo_storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {

  bucket = aws_s3_bucket.demo_storage.id

  rule {
    id = "lifecycle"

    expiration {
      days = "14"
    }

    status = "Enabled"
  }
}
