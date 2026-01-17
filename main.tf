# provider "aws" {
#     region = var.region
#     access_key = var.aws_access_key
#     secret_key = var.aws_secret_key
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#       name = "name"
#       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
  
# }

# resource "aws_instance" "my-ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#       name = "MYEC2INSTANCE"
#     }
  
# }

#Condtionals & Locals 

# provider "aws" {
#     region = var.region
#     access_key = var.aws_access_key
#     secret_key = var.aws_secret_key
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#       name = "name"
#       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
  
# }

# locals {
#   name_tag = var.instance_type == "t3.micro" ? "Micro Instance" : "Standard Instance"
# }

# resource "aws_instance" "my-ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#       name = local.name_tag
#     }
  
# }

#Depends_on

# provider "aws" {
#     region = var.region
#     access_key = var.aws_access_key
#     secret_key = var.aws_secret_key
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#       name = "name"
#       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
  
# }

# resource "aws_instance" "my-ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#       name = "MYEC2INSTANCE"
#     }

#     depends_on = [ aws_s3_bucket.myterraforms3bucket-chandra-20260116 ]
  
# }

# resource "aws_s3_bucket" "myterraforms3bucket-chandra-20260116" {
#   bucket = var.bucket_name

#   tags = {
#     Name = "MyS3bucket"
#   }
# }

#Modules

# provider "aws" {
#     region = var.region
#     access_key = var.aws_access_key
#     secret_key = var.aws_secret_key
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#       name = "name"
#       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
  
# }


# module "ec2_instance" {
#   source = "./ec2-module"
#   ami = data.aws_ami.amazon_linux.id
#   instance_type = "t3.micro"
#   name = "my-ec2-instance"
# }

#Workspaces

# provider "aws" {
#     region = var.region
#     access_key = var.aws_access_key
#     secret_key = var.aws_secret_key
# }

# data "aws_ami" "amazon_linux" {
#     most_recent = true
#     owners = ["amazon"]

#     filter {
#       name = "name"
#       values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#     }
  
# }

# resource "aws_instance" "my-ec2" {
#     ami = data.aws_ami.amazon_linux.id
#     instance_type = var.instance_type

#     tags = {
#       name = "EC2-${terraform.workspace}"
#       Environment = terraform.workspace
#     }
  
# }

provider "aws" {
    region = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}