output "aws_elastic_ip" {
    value = aws_instance.my-ec2.public_ip
  
}