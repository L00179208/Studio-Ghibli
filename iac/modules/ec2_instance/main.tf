resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  provisioner "file" {
    source      = "../../id_rsa.pub"
    destination = "/home/ubuntu/.ssh/authorized_keys"
  }

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = var.security_groups

  lifecycle {
    create_before_destroy = true
  }
}
