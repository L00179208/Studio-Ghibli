provider "aws" {
  region = "eu-west-2" # Change this to your desired region
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "academic-key-pair" # Change this to your key pair name
}

resource "aws_instance" "docker" {
  ami           = "ami-053a617c6207ecc7b" # Example AMI ID, replace with your own
  instance_type = "t2.micro"
  key_name      = var.key_name

  # Additional configurations...
}
