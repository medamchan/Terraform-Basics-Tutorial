terraform {
    backend "s3" {
      bucket = "terraform-state-bucket-260116"
      key = "dev/project/terraform.tfstate"
      region = "us-east-1"
      use_lockfile = true
      encrypt = true
    }
}