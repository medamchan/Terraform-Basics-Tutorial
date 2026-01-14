variable "region" {
    default = "us-east-1"
}

variable "instance_type" {
    default = "t3.micro"
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
