provider "aws" {
  region = "eu-west-2" # Update to your region
}

resource "aws_instance" "docker" {
  ami           = "ami-053a617c6207ecc7b" # Update to your AMI
  instance_type = "t2.micro"
  key_name      = "academic-key-pair" # Use your existing key pair name

  tags = {
    Name = "DockerInstance"
  }
}

output "instance_ip" {
  value = aws_instance.docker.public_ip
}
