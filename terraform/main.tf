provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "docker" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ubuntu
    sudo apt-get install -y docker-compose
  EOF

  tags = {
    Name = "docker"
  }

  output "instance_ip" {
    value = aws_instance.docker.public_ip
  }

  variable "key_name" {
    description = "Name of the SSH key pair"
  }

}
