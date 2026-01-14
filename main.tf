provider "aws" {
    region = var.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
  
}

resource "aws_instance" "my-ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

    tags = {
      name = "MYEC2INSTANCE"
    }
  
}