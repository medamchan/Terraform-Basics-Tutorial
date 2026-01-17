provider "aws" {
    region = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket
    force_destroy = true
    versioning {
      enabled = true
    }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
    
  }
  tags = {
    Name = "Terraform State Bucket"
    Environment = var.Environment
  }
}

resource "aws_dynamodb_table" "terraform-state-lock-table" {
    name = var.lock_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type= "S"
    }

    tags = {
      name = "TerraformStateLockTable"
      Environment = var.Environment
    }
  
}