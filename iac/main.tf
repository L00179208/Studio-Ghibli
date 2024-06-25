provider "aws" {
  region = "eu-north-1"
}

module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  sg_name            = var.sg_name
}

module "ec2_instance" {
  source          = "./modules/ec2_instance"
  instance_name   = var.instance_name
  instance_type   = var.instance_type
  ami_id          = var.ami_id
  key_name        = var.key_name
  security_groups = [module.network.sg_id]
  subnet_id       = module.network.public_subnet_id
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "security_group_id" {
  value = module.network.sg_id
}
