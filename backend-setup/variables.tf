variable "region" {
    default = "us-east-1"
}
variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  sensitive   = true
}
variable "bucket" {
    default = "terraform-state-bucket-260116"
}
variable "Environment" {
    default = "dev"
}

variable "lock_table" {
    default = "lock_table"
}