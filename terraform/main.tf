provider "aws" {
  region = "eu-west-2" # Update to your region
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "academic-key-pair"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "docker" {
  ami           = "ami-053a617c6207ecc7b" # Update to your AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "DockerInstance"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.ssh_key.private_key_pem}' > private_key.pem"
  }
}

output "instance_ip" {
  value = aws_instance.docker.public_ip
}

output "private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
